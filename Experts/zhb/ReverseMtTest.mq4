#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <CommonService.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
//  反马丁策略的使用
//enum ORDER_STATUS { 1=BLANK,2=BLANK_PROFIT,3=HALF,4=FULL};
enum RUN_MODE_EUNM {NormalMode, BuyOnlyMode, SellOnlyMode};
const input RUN_MODE_EUNM RUN_MODE=NormalMode;

int orderStatus = 1;
// 交易币对
string symbol = Symbol();
//input string symbol = Symbol();
// 突破
input int openDayVal = 20;
// atr 取值范围
input int atrValRange = 20;
// 是否进行保护性，如果开启，那么protectedOpenDayVal 将生效
input bool protectedFlag = false;
// 如果上一次盈利，这一次则不交易，但是又突破了55日的，那么进行加仓

input int protectedOpenDayVal = 55;
bool protectedStartFlag = false;

// 加仓系数，每次加 addPosition * atr值
double addPosition = 0.5;
// 退出策略 价格下跌 exitStopLossRate * atr 就进行退出
double exitStopLossRate = 2;
// k线间隔
input int period = PERIOD_D1;
// 定时退出间隔
input int timingExit = 60;
const string COMMENT = "STB";
int magicNumber = 10001;

// 下单量, 根据自己资金量，人工控制下单量
extern double myLots = 0.01;

// 是否开启自动下单资金控制, 默认不开启，注意跑历史数据一般需要开启
extern bool lotsAutoIncrement = false;

// 下单基准，如果 1000 对应 0.01， 2000 对应0.02
input double moneyUnitRate = 100000;

// 常量
const int BLANK =1,BLANK_PROFIT=2, HALF=3, FULL =  4;

double atrVal = 0;

Order buyOrders[];

Order sellOrders[];


bool initAtrVal(int bar = 1) {


	double value = iATR(symbol,period,atrValRange,bar);
    atrVal = NormalizeDouble(value,5);
	printf("initAtrVal value: %g,   atrVal:  %g ",  value,  atrVal);
	if (!Math:: gt(atrVal,0)){
        printf("init AtrVal failture atrVal: %g",atrVal);
        // 初始化atrVal失败，终止程序运行
        ExpertRemove();

    }
    return Math:: gt(atrVal,0);
}



class Handle {

	public:
		virtual bool support() {
			return false;
		}
		virtual void execute() {
			printf("Handle.execute");
		}

	protected:
		//向上突破
		bool breakHighPrice(int inteval) {
            int highBar = iHighest(symbol,period,MODE_HIGH,inteval, 1);
            double highPrice = iHigh(symbol,period,highBar);

            if(Math:: ge(MarketInfo(symbol,MODE_ASK),highPrice)){
                return true;
            }
            return false;

        }
        // 向下突破
        bool breakLowPrice(int inteval) {

            int lowBar = iLowest(symbol,period,MODE_LOW,inteval,1);
            double lowPrice = iLow(symbol,period,lowBar);
            if(Math:: ge(lowPrice,MarketInfo(symbol,MODE_BID))){
                return true;
            }
            return false;
        }

        Order getLastOrder() {
              // 拿到最后的订单
            Order lastOrder = ArraySize(buyOrders) >0 ? buyOrders[ArraySize(buyOrders) -1] : sellOrders[ArraySize(sellOrders) -1];
            return lastOrder;
        }

        Order getFirstOrder() {
              // 拿到最后的订单
            Order lastOrder = ArraySize(buyOrders) >0 ? buyOrders[0] : sellOrders[0];
            return lastOrder;
        }

        // 计算开仓手数
        double calcLots() {

			// 计算资金，采用累加原则

			if(!lotsAutoIncrement){
				return myLots;
			}

			double tempLots = NormalizeDouble(AccountBalance()/ moneyUnitRate,3);

			int temp = tempLots * 100;

			if(tempLots > myLots){
//				printf("current accountBalance:  %g   temp: %i   tempLots: %g ",AccountBalance() ,temp, tempLots);
				myLots = temp * 0.01;
			}

			return myLots;
        }
};


// 如果是空仓
class BlankHandle : public Handle {

	public:
		bool support() {
			return orderStatus == BLANK;
		}
		void execute() {

	        if(BuyOnlyMode == RUN_MODE || NormalMode == RUN_MODE){

				// 破高
				if(breakHighPrice(openDayVal)){
					// 立即买入
					if(!initAtrVal()){
	                    return;
	                }

					printf("BlankHandle first buy order artval: %g    calcLots: %g , currentBuyPrice: %g, addPosition: %g, exitStopLossRate: %g",  atrVal ,calcLots(),Trade::ask(symbol),addPosition,exitStopLossRate);
					Trade::buyMarket(symbol,calcLots(),magicNumber,COMMENT);
					//设置状态
					protectedStartFlag = false;
					orderStatus = HALF;
				}
            }

            if(SellOnlyMode == RUN_MODE || NormalMode == RUN_MODE){
				// 破低，做空
				if(breakLowPrice(openDayVal)){
					if(!initAtrVal()){
	                    return;
	                }
					printf("BlankHandle first sell order artval: %g   calcLots: %g, currentSellPrice: %g,  addPosition: %g, exitStopLossRate: %g",  atrVal,calcLots(),Trade::bid(symbol),addPosition,exitStopLossRate);
					Trade::sellMarket(symbol,calcLots(),magicNumber,COMMENT);
					protectedStartFlag = false;
					orderStatus = HALF;
				}

            }
		}

};

// 上一次盈利的空仓
class BlankProfitHandle : public Handle {
	public:
		bool support() {
			return orderStatus == BLANK_PROFIT;
		}
	    void execute() {
		   if(BuyOnlyMode == RUN_MODE || NormalMode == RUN_MODE){
				// 破高
	            if(breakHighPrice(protectedOpenDayVal)){
	                // 立即买入
	                if(!initAtrVal()){
	                    return;
	                }
					printf("BlankProfitHandle first buy order artval: %g    calcLots: %g , currentBuyPrice: %g , addPosition: %g, exitStopLossRate: %g",  atrVal ,calcLots(),Trade::bid(symbol),addPosition,exitStopLossRate);
	                Trade::buyMarket(symbol,calcLots(),magicNumber,COMMENT);
	                protectedStartFlag = true ;
	                orderStatus = HALF;

	            }
	        }
           if(SellOnlyMode == RUN_MODE || NormalMode == RUN_MODE){

	            // 破低，做空
	            if(breakLowPrice(protectedOpenDayVal)){
	               if(!initAtrVal()){
	                   return;
	               }
					printf("BlankProfitHandle first sell order artval: %g   calcLots: %g, currentSellPrice: %g,  addPosition: %g, exitStopLossRate: %g",  atrVal,calcLots(),Trade::ask(symbol),addPosition,exitStopLossRate);
	                Trade::sellMarket(symbol,calcLots(),magicNumber,COMMENT);
	                protectedStartFlag = true;
	                orderStatus = HALF;
	            }

           }

		}
};

// 半仓
class HalfHandle : public Handle{

	public:
        bool support() {
            return orderStatus == HALF;
        }
        void execute() {
			// 重新加载订单
            Trade:: loadOrders(buyOrders,symbol,OP_BUY,magicNumber);
            Trade:: loadOrders(sellOrders,symbol,OP_SELL,magicNumber);
			//上涨

			int ordertotalNum = ArraySize(buyOrders) + ArraySize(sellOrders);

			if(ordertotalNum == 0){
				printf("HalfHandle error orderStatus: %i", orderStatus);
				orderStatus = BLANK;
				return;
			}
			Order lastOrder = getLastOrder();
			// 买单 价格上涨
			if(lastOrder.orderType == OP_BUY){

				double currentPrice = Trade:: ask(symbol);
				// 买单
				double spotVal =  lastOrder.openPrice - currentPrice;
				// 大于0 下跌
				if(Math::gt(spotVal,exitStopLossRate * atrVal)){
					// 平掉所有订单，修改状态
					printf("buyOrder half stop loss orderOpenPrice:  %g   currentSellPrice: %g   atrVal: %g ,  addPosition: %g, exitStopLossRate: %g", lastOrder.openPrice, currentPrice, atrVal, addPosition, exitStopLossRate);
					OrderService::closeAllAndReturnProfit(symbol,magicNumber);
					// 手数累加
					orderStatus = BLANK;
					return;
				}
				spotVal = currentPrice -lastOrder.openPrice;
				if(Math::gt(spotVal,addPosition * atrVal)){
					// 加仓
					printf("buyOrder half add money orderOpenPrice: %g   currentSellPrice: %g   atrVal: %g ,  addPosition: %g, exitStopLossRate: %g" , lastOrder.openPrice, currentPrice,atrVal,addPosition, exitStopLossRate);
                    Trade::buyMarket(symbol,calcLots(),magicNumber,COMMENT);
                    Trade:: loadOrders(buyOrders,symbol,OP_BUY,magicNumber);

				}
			}else if(lastOrder.orderType == OP_SELL){

				double currentPrice = Trade:: bid(symbol);

				double spotVal =  lastOrder.openPrice - currentPrice;

				// 大于0 上涨
				if(Math::gt(spotVal,addPosition * atrVal)){
                    // 加仓
                    printf("sellOrder half add money orderOpenPrice: %g   currentBuyPrice: %g    atrVal: %g,  addPosition: %g, exitStopLossRate: %g", lastOrder.openPrice, currentPrice, atrVal,addPosition, exitStopLossRate);
                    int ticket = Trade::sellMarket(symbol,calcLots(),magicNumber,COMMENT);
                    Trade:: loadOrders(sellOrders,symbol,OP_SELL,magicNumber);

                }

                spotVal = currentPrice - lastOrder.openPrice;
                if(Math::gt(spotVal, exitStopLossRate * atrVal)){
                    // 平仓
                    printf("sellOrder half stop loss orderOpenPrice: %g   currentBuyPrice: %g   atrVal: %g,  addPosition: %g, exitStopLossRate: %g ", lastOrder.openPrice ,  currentPrice , atrVal,addPosition, exitStopLossRate);
                    OrderService::closeAllAndReturnProfit(symbol,magicNumber);
                    orderStatus = BLANK;
                    return;
                }

			}
        }

};

Handle *handles[3];

int OnInit() {

	// 重新加载订单
    Trade:: loadOrders(buyOrders,symbol,OP_BUY,magicNumber);
    Trade:: loadOrders(sellOrders,symbol,OP_SELL,magicNumber);
	// 初始化状态， 如果已经有订单了 根据订单数量初始化状态， atrVal

	if(ArraySize(buyOrders)> 0 && ArraySize(sellOrders) > 0){
		PrintFormat("trade load order error , buyOrders Size: %i , sellOrderSize: %i",ArraySize(buyOrders),ArraySize(sellOrders));
		ExpertRemove();
		return 0;
	}

	int ordertotalNum = ArraySize(buyOrders) + ArraySize(sellOrders);

    if(ordertotalNum > 0){

        // 拿到最先的订单
        Order firstOrder = ArraySize(buyOrders) >0 ? buyOrders[0] : sellOrders[0];

		PrintFormat("init firstOrder orderTicket: %i", firstOrder.ticket);

        // 计算相差时间，计算准确的  atr值
        int bar = iBarShift(symbol,period,firstOrder.openTime);

        if(!initAtrVal(bar+1)){
            return (0);
        }

        orderStatus = HALF;
    }
    // 初始化 手数
    if(lotsAutoIncrement){

	    double tempLots = NormalizeDouble(AccountBalance()/ moneyUnitRate,3);
	    int temp = tempLots * 100;

	    myLots = temp * 0.01;

	    if(myLots < MarketInfo(symbol,MODE_MINLOT)){
	        printf("init myLots error myLots: %g ",myLots);
	        myLots = MarketInfo(symbol,MODE_MINLOT);
	    }
    }

    printf("init myLots value: %g   and orderStatus: %i   OrdersTotal(): %i   initAtrVal : %g", myLots, orderStatus, ordertotalNum, atrVal);

    handles[0] = new BlankHandle();
    handles[1] = new BlankProfitHandle();
    handles[2] = new HalfHandle();

    return (0);

}
// 加长间距 每次加大
void countAddPosition(){

	int ordertotalNum = ArraySize(buyOrders) + ArraySize(sellOrders);

	addPosition = 0.3 + (ordertotalNum/3 * 0.1);
}


void countExitStopLossRate(){

	int ordertotalNum = ArraySize(buyOrders) + ArraySize(sellOrders);

	exitStopLossRate = 4.0 - (ordertotalNum/2 * 0.1);

	if(exitStopLossRate <= 0.2){
		exitStopLossRate =0.2;
	}

}



void OnTick() {

	 if(!IsTradeAllowed()) {
	    // Print("trade is not allowed");
	    return;
	  }
	 RefreshRates();
	// 重新加载订单
	Trade:: loadOrders(buyOrders,symbol,OP_BUY,magicNumber);
	Trade:: loadOrders(sellOrders,symbol,OP_SELL,magicNumber);

	countAddPosition();
	countExitStopLossRate();


	for(int i = 0; i< ArraySize(handles); i++){
		if(handles[i].support()){
			handles[i].execute();
		}
	}

}

void OnDeinit(const int reason)
{
	//--- destroy timer
	for(int i = 0; i< ArraySize(handles); i++){
        delete handles[i];
    }

}
