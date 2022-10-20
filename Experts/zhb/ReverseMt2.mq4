#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <Trader.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
//  马丁策略，反向购买的使用，任意方向下单，止损40点，止盈100点，如果亏损，立即加倍反方向下单，
// 交易币对，每天交易一次，每次定时
string symbol = Symbol();
//input string symbol = Symbol();
// 突破

input double myLots = 0.01;
input int stopLoss = 70;
input int stopProfit = 210;
input int totalLimitLots = 10;

CTrader ctrader(1009);



int OnInit() {

    return (0);

}

string BUYMODE = "BUY",SELLMODE = "SELL";

string mode = BUYMODE;
int stopLossOrderCount = 0;

void OnTick() {

	 if(!IsTradeAllowed()) {
	    // Print("trade is not allowed");
	    return;
	  }

	

	  if(ctrader.buyCount == 0 & ctrader.sellCount == 0){
	        if(stopLossOrderCount == 0){
	             if(TimeDayOfWeek(TimeCurrent()) == 5){
                    return ;
                 }
	            ctrader.buy(myLots);
	            mode = SELLMODE;
	        }else{

	            if(stopLossOrderCount == totalLimitLots){
	                // 亏损加大了，重新从 0开始下单 
	                printf("stopLossOrderCount ==  totalLimitLots, stopLossOrderCount: %i", stopLossOrderCount);
	                stopLossOrderCount = 0;
	                return;
	            }

				if(mode == BUYMODE){
					ctrader.buy(getLots(stopLossOrderCount));
					mode = SELLMODE;
				}else{
					ctrader.sell(getLots(stopLossOrderCount));
					mode = BUYMODE;
				}
	        }

	  }else{
		ctrader.selectLastOrder();

		if(OrderType() == OP_BUY){

			if(OrderOpenPrice() > ctrader.bid()){
				// 损失关闭订单
				double stopLossVal = OrderOpenPrice() - ctrader.bid();
				int stopLossCount =  stopLossVal * MathPow(10,ctrader.digits());
				if(stopLossCount >= stopLoss){
					ctrader.closeBuy();
					stopLossOrderCount ++;
				}
			}else{
				// 盈利卖出
				double stopProfitVal =  ctrader.bid() -OrderOpenPrice() ;
				int stopProfitCount =  stopProfitVal * MathPow(10,ctrader.digits());
				if(stopProfitCount >= stopProfit){
                    ctrader.closeBuy();
                    stopLossOrderCount = 0;
                }
			}

		}
		if(OrderType() == OP_SELL){

			if(OrderOpenPrice() > ctrader.ask()){
				// 盈利卖出
				double stopProfitVal = OrderOpenPrice() - ctrader.ask();
				int stopProfitCount =  stopProfitVal * MathPow(10,ctrader.digits());
				if(stopProfitCount >= stopProfit){
					ctrader.closeSell();
					stopLossOrderCount = 0;
				}
			}else{
				// 损失关闭订单
				double stopLossVal =  ctrader.ask() -OrderOpenPrice() ;
				int stopLossCount =  stopLossVal * MathPow(10,ctrader.digits());
				if(stopLossCount >= stopLoss){
                    ctrader.closeSell();
                    stopLossOrderCount ++;
                }
			}

		}

	  }


}

double getLots(int count) {

//    if (count == 1 || count == 2)
//    {
//        return 0.01;
//    }
//    else
//    {
//        return getLots(count - 1) + getLots(count - 2);
//    }

	if(count == 1 ){
		return myLots;
	}
	return myLots * MathPow(2,(count+1));
}

void OnDeinit(const int reason)
{

}
