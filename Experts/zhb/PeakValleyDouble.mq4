#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| 峰谷交易法                 |
//+------------------------------------------------------------------+
#include <Trader.mqh>

input int period  = 1440;
input double highRsi = 65.0;
input double lowRsi = 35.0;
input double firstOrderAtrRate = 2.0;
input int inteval = 55;
input int exitInteval = 10;
input int dayRange = 5;
double addPosition = 0.1;
double stopLossRange = 2.0;
input int atrRange = 20;
input double myLots = 0.01;


string symbol = Symbol();

input double addPositionFinal = 0.5;
input double exitStopLossFinal = 0.5;
input int addPositionOrderNumRate = 1;
input int exitStopLossOrderNumRate = 1;
input double addPositionOrderNumFloat = 0.2;
input double exitStopLossOrderNumFloat = 0.2;
CTrader ctrader(1009);

// 加长间距 每次加大
void countAddPosition(){

	int ordertotalNum = ctrader.buyCount + ctrader.sellCount;

	addPosition = addPositionFinal + (ordertotalNum/addPositionOrderNumRate * addPositionOrderNumFloat);
}

void countExitStopLossRate(){

	int ordertotalNum = ctrader.buyCount + ctrader.sellCount;

	stopLossRange = exitStopLossFinal - (ordertotalNum/exitStopLossOrderNumRate *exitStopLossOrderNumFloat);

	// 最小只减到0.2
	if(stopLossRange <= 0.1){
		stopLossRange =0.1;
	}

}

int OnInit() {

	return 0;

}
double atrVal;
void OnTick() {

	int orderTotolNum = ctrader.buyCount + ctrader.sellCount;

	// 没有订单的情况
	if(orderTotolNum == 0){

		int highBar = iHighest(symbol,period,MODE_HIGH,inteval, 0);
		double highPrice = iHigh(symbol,period,highBar);

		// 天数范围
		if(highBar <dayRange){

			double value = iATR(symbol,period,atrRange,highBar);
			// 当前价格判断
			double operattionPrice =  ctrader.bid() +  firstOrderAtrRate * value ;
			atrVal = value;
			if(operattionPrice <= highPrice){
				ctrader.sell(myLots);
				return;
			}
		}


		int lowBar = iLowest(symbol,period,MODE_LOW,inteval,0);
		double lowPrice = iLow(symbol,period,lowBar);

		if(lowBar < dayRange){
		    double value = iATR(symbol,period,atrRange,lowBar);
		    atrVal = value;
		    double operattionPrice =  ctrader.ask() -  firstOrderAtrRate * value ;

		    if(operattionPrice >= lowPrice){
				ctrader.buy(myLots);
				return;
		    }

		}


	}else{

		if(ctrader.buyCount > 0){

			// 止损
			ctrader.selectLastBuyOrder();
			if(OrderOpenPrice() > (ctrader.bid()+ stopLossRange * atrVal)){
				ctrader.closeBuy();
				return;
			}
			// 加仓操作
			double subVal = ctrader.bid() - OrderOpenPrice();
			if(subVal >= addPosition*atrVal){
				ctrader.buy(myLots);
			}


		}else{
			ctrader.selectLastSellOrder();
            if(OrderOpenPrice() < (ctrader.bid()- stopLossRange * atrVal)){
                ctrader.closeSell();
                return;
            }
			int bar = iBarShift(symbol,period,OrderOpenTime());

            double subVal = OrderOpenPrice()-ctrader.ask();

            if(subVal >= addPosition*atrVal){
                ctrader.sell(myLots);
            }
		}


	}






}


void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");

}

void OnTimer(){


}


