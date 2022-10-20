#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| 峰谷交易法                 |
//+------------------------------------------------------------------+
#include <Trader.mqh>

input int period  = 60;
input int maxPeriod = 240;
input double highRsi = 70.0;
input double lowRsi = 30.0;
input double firstOrderAtrRate = 1.0;
input int inteval = 10;
input int exitInteval = 10;
input int dayRange = 5;
input double addPosition = 0.5;
input double stopLossRange = 2;
input int atrRange = 20;
input int rsiRange = 3;
input double myLots = 0.01;

string symbol = Symbol();


CTrader ctrader(1009);

int OnInit() {

	return 0;

}
double atrVal;
void OnTick() {

	int orderTotolNum = ctrader.buyCount + ctrader.sellCount;

	// 没有订单的情况
	if(orderTotolNum == 0){

		int highBar = iHighest(symbol,period,MODE_HIGH,inteval, 1);
		double highPrice = iHigh(symbol,period,highBar);
		double rsiVal = iRSI(symbol,period,rsiRange,PRICE_CLOSE,highBar);

		// 第一，检查大周期的趋势，大周期的趋势决定了，买卖的方向，或者是不交易， 使用macd123确定大周期的趋势，如果没有趋势，不进行交易

		 double MACD_1 = iMACD(NULL, maxPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1);
		 double MACD_2 = iMACD(NULL, maxPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2);
		 double MACD_3 = iMACD(NULL, maxPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 3);

		// 范围
		if(rsiVal >= lowRsi){

			if(highBar <dayRange){

				double value = iATR(symbol,period,atrRange,highBar);
				// 当前价格判断
				double operattionPrice =  ctrader.bid() +  firstOrderAtrRate * value ;
				atrVal = value;
				// 当前价格下跌
				if(operattionPrice <= highPrice){
					ctrader.sell(myLots);
					return;
				}
			}

		}


		  int lowBar = iLowest(symbol,period,MODE_LOW,inteval,0);
          double lowPrice = iLow(symbol,period,lowBar);

		if(rsiVal <= highRsi){

		  if(lowBar < dayRange){

		        double value = iATR(symbol,period,atrRange,lowBar);
		        atrVal = value;
		        double operattionPrice =  ctrader.ask() -  firstOrderAtrRate * value ;
				// 当前价格上涨
		        if(operattionPrice >= lowPrice){
						ctrader.buy(myLots);
						return;
		        }

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
			// 最少超过10个时间间隔
			int bar = iBarShift(symbol,period,OrderOpenTime());
            if(bar>= exitInteval){
				// 计算区间最高价格
				ctrader.closeBuy();
//				int highBar = iHighest(symbol,period,MODE_HIGH,exitInteval, 0);
//				double highPrice = iHigh(symbol,period,highBar);
//
//
//				if(highBar < dayRange){
//
//					double value = iATR(symbol,period,atrRange,highBar);
//		            // 当前价格判断
//		            double operattionPrice =  ctrader.bid() +  stopLossRange * value ;
//		            if(operattionPrice <= highPrice){
//		                ctrader.closeBuy();
//		            }
//
//				}
            }

		}else{
			ctrader.selectLastSellOrder();
            if(OrderOpenPrice() < (ctrader.bid()- stopLossRange * atrVal)){
                ctrader.closeSell();
                return;
            }
			int bar = iBarShift(symbol,period,OrderOpenTime());

            if(bar>= exitInteval){
				ctrader.closeSell();
//				int lowBar = iLowest(symbol,period,MODE_LOW,exitInteval,0);
//				double lowPrice = iLow(symbol,period,lowBar);
//
//				if(lowBar < dayRange){
//
//				    double value = iATR(symbol,period,atrRange,lowBar);
//				    double operattionPrice =  ctrader.ask() -  stopLossRange * value ;
//
//				    if(operattionPrice >= lowPrice){
//				        ctrader.closeSell();
//				    }
//
//				}

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


