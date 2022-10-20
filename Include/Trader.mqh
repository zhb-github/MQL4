class CTrader {
    public:
        const int MAGIC_NUMBER;
        const string DEFAULT_COMMENT;
        const double DEFAULT_LOT;
        int buyCount;
        int sellCount;
        double buyLot;
        double sellLot;
        
        CTrader(int _magicNumber): MAGIC_NUMBER(_magicNumber), DEFAULT_LOT(miniLot()) {}
        CTrader(int _magicNumber, double _defaultLot): MAGIC_NUMBER(_magicNumber), DEFAULT_LOT(fixedLot(_defaultLot)) {}
        CTrader(int _magicNumber, string _defaultComment): MAGIC_NUMBER(_magicNumber), DEFAULT_COMMENT(_defaultComment), DEFAULT_LOT(miniLot()) {}
        CTrader(int _magicNumber, string _defaultComment, double _defaultLot): MAGIC_NUMBER(_magicNumber), DEFAULT_COMMENT(_defaultComment), DEFAULT_LOT(fixedLot(_defaultLot)) {}

        // system functions
        double ask() {
            return MarketInfo(NULL, MODE_ASK);
        }
        double bid() {
            return MarketInfo(NULL, MODE_BID);
        }
        double spread() {
            return MarketInfo(NULL, MODE_SPREAD);
        }
        double point() { // 0.00001 for EURUSD
            return MarketInfo(NULL, MODE_POINT);
        }
        double digits() { // 5.0 for EURUSD
            return MarketInfo(NULL, MODE_DIGITS);
        }
        double stopLevel() {
            return MarketInfo(NULL, MODE_STOPLEVEL);
        }
        double miniLot() { // 0.01
            return MarketInfo(NULL, MODE_MINLOT);
        }

        // utils
        double fixedLot(double _lot) {
            double lot=NormalizeDouble(_lot, int(-log10(miniLot())));
            return lot<miniLot() ? miniLot() : lot;
        }
        
        // operation functions
        int buy(double _orderLot=0, double _stoploss=0, double _takeprofit=0, string _comment=NULL) {
            if(_orderLot<0) {
                printf("_orderLot must be positive: _orderLot=%g", _orderLot);
                return 0;
            }
            _orderLot=_orderLot==0 ? DEFAULT_LOT : fixedLot(_orderLot);
            if(_comment==NULL) _comment=DEFAULT_COMMENT;
            int ticket=OrderSend(NULL,OP_BUY,_orderLot,ask(),3,_stoploss,_takeprofit,_comment,MAGIC_NUMBER,0,Blue);
            if(ticket>0) {
                buyCount++;
                buyLot+=_orderLot;
            }
            else printf("ticket=%i, type=buy, lots=%g, symbol=%s, price=%g, sl=%g, tp=%g, error=%i", ticket, _orderLot, _Symbol, ask(), _stoploss, _takeprofit, GetLastError());
            return ticket;
        }

        int sell(double _orderLot=0, double _stoploss=0, double _takeprofit=0, string _comment=NULL) {
            if(_orderLot<0) {
                printf("_orderLot must be positive: _orderLot=%g", _orderLot);
                return 0;
            }
            _orderLot=_orderLot==0 ? DEFAULT_LOT : fixedLot(_orderLot);
            if(_comment==NULL) _comment=DEFAULT_COMMENT;
            int ticket=OrderSend(NULL,OP_SELL,_orderLot,bid(),3,_stoploss,_takeprofit,_comment,MAGIC_NUMBER,0,Red);
            if(ticket>0) {
                sellCount++;
                sellLot+=_orderLot;
            }
            else printf("ticket=%i, type=sell, lots=%g, symbol=%s, price=%g, sl=%g, tp=%g, error=%i", ticket, _orderLot, _Symbol, bid(), _stoploss, _takeprofit, GetLastError());
            return ticket;
        }

        void closeByTicket(int ticket) {
            if(OrderTicket()!=ticket && !OrderSelect(ticket,SELECT_BY_POS,MODE_TRADES)) return;
            if(OrderMagicNumber()!=MAGIC_NUMBER) return;
            bool success;
            if(OrderType()==OP_BUY) {
                success=OrderClose(OrderTicket(),OrderLots(),bid(),0,Yellow);
                if(success) {
                    buyCount--;
                    buyLot-=OrderLots();
                }
                else printf("close buy error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), bid());
            }
            if(OrderType()==OP_SELL) {
                success=OrderClose(OrderTicket(),OrderLots(),ask(),0,Orange);
                if(success) {
                    sellCount--;
                    sellLot-=OrderLots();
                }
                else printf("close sell error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), ask());
            }
        }

        void closeBuyReverse() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_BUY) continue;
                bool success=OrderClose(OrderTicket(),OrderLots(),bid(),0,Yellow);
                if(success) {
                    buyCount--;
                    buyLot-=OrderLots();
                }
                else printf("close buy error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), bid());
            }
        }

        void closeSellReverse() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_SELL) continue;
                bool success=OrderClose(OrderTicket(),OrderLots(),ask(),0,Orange);
                if(success) {
                    sellCount--;
                    sellLot-=OrderLots();
                }
                else printf("close sell error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), ask());
            }
        }

        void closeBuy() {
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_BUY) continue;
                bool success=OrderClose(OrderTicket(),OrderLots(),bid(),0,Yellow);
                if(success) {
                    i--;
                    buyCount--;
                    buyLot-=OrderLots();
                }
                else printf("close buy error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), bid());
            }
        }

        void closeSell() {
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_SELL) continue;
                bool success=OrderClose(OrderTicket(),OrderLots(),ask(),0,Orange);
                if(success) {
                    i--;
                    sellCount--;
                    sellLot-=OrderLots();
                }
                else printf("close sell error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), ask());
            }
        }

        void closeAllReverse() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                bool success;
                if(OrderType()==OP_BUY) {
                    success=OrderClose(OrderTicket(),OrderLots(),bid(),0,Yellow);
                    if(success) {
                        buyCount--;
                        buyLot-=OrderLots();
                    }
                    else printf("close buy error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), bid());
                }
                if(OrderType()==OP_SELL) {
                    success=OrderClose(OrderTicket(),OrderLots(),ask(),0,Orange);
                    if(success) {
                        sellCount--;
                        sellLot-=OrderLots();
                    }
                    else printf("close sell error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), ask());
                }
            }
        }

        void closeAll() {
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                bool success;
                if(OrderType()==OP_BUY) {
                    success=OrderClose(OrderTicket(),OrderLots(),bid(),0,Yellow);
                    if(success) {
                        i--;
                        buyCount--;
                        buyLot-=OrderLots();
                    }
                    else printf("close buy error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), bid());
                }
                if(OrderType()==OP_SELL) {
                    success=OrderClose(OrderTicket(),OrderLots(),ask(),0,Orange);
                    if(success) {
                        i--;
                        sellCount--;
                        sellLot-=OrderLots();
                    }
                    else printf("close sell error: ticket=%i, lots=%g, symbol=%s, price=%g", OrderTicket(), OrderLots(), OrderSymbol(), ask());
                }
            }
        }

        void reloadOrderCount() {
            buyCount=0;
            sellCount=0;
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_BUY) {
                    buyCount++;
                    continue;
                }
                if(OrderType()==OP_SELL) {
                    sellCount++;
                    continue;
                }
            }
        }

        // custom select
        bool selectFirstBuyOrder() {
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_BUY) return true;
            }
            return false;
        }

        bool selectFirstSellOrder() {
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_SELL) return true;
            }
            return false;
        }

        bool selectLastBuyOrder() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_BUY) return true;
            }
            return false;
        }

        bool selectLastSellOrder() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_SELL) return true;
            }
            return false;
        }
	    bool selectLastOrder() {
            for(int i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()==MAGIC_NUMBER) return true;
            }
            return false;
        }

        // readable

        datetime previousBuyTime() {
            int i;
            for(i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_BUY) return OrderOpenTime();
            }
            for(i=OrdersHistoryTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_BUY) return OrderOpenTime();
            }
            return NULL;
        }

        datetime previousSellTime() {
            int i;
            for(i=OrdersTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_SELL) return OrderOpenTime();
            }
            for(i=OrdersHistoryTotal()-1; i>=0; i--) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()==OP_SELL) return OrderOpenTime();
            }
            return NULL;
        }

        double buyProfit() {
            double sum=0;
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_BUY) continue;
                sum+=OrderProfit();
            }
            return sum;
        }

        double sellProfit() {
            double sum=0;
            for(int i=0; i<OrdersTotal(); i++) {
                if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
                if(OrderMagicNumber()!=MAGIC_NUMBER) continue;
                if(OrderType()!=OP_SELL) continue;
                sum+=OrderProfit();
            }
            return sum;
        }
};