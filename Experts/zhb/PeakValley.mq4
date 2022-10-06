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
input double addPosition = 0.5;
input double stopLossRange = 4.0;
input int atrRange = 20;
input int rsiRange = 20;
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

		int highBar = iHighest(symbol,period,MODE_HIGH,inteval, 0);
		double highPrice = iHigh(symbol,period,highBar);

		double rsiVal = iRSI(symbol,period,rsiRange,PRICE_CLOSE,highBar);

		// 天数范围
		if(rsiVal <= lowRsi){

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

		}


		  int lowBar = iLowest(symbol,period,MODE_LOW,inteval,0);
          double lowPrice = iLow(symbol,period,lowBar);

		if(rsiVal>= highRsi){
		  if(lowBar < dayRange){
		        double value = iATR(symbol,period,atrRange,lowBar);
		        atrVal = value;
		        double operattionPrice =  ctrader.ask() -  firstOrderAtrRate * value ;

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
			// 最少超过10日
			int bar = iBarShift(symbol,period,OrderOpenTime());
            if(bar> exitInteval){

				// 计算区间最高价格
				int highBar = iHighest(symbol,period,MODE_HIGH,exitInteval, 0);
				double highPrice = iHigh(symbol,period,highBar);


				if(highBar < dayRange){

					double value = iATR(symbol,period,atrRange,highBar);
		            // 当前价格判断
		            double operattionPrice =  ctrader.bid() +  stopLossRange * value ;
		            if(operattionPrice <= highPrice){
		                ctrader.closeBuy();
		            }

				}
            }

		}else{
			ctrader.selectLastSellOrder();
            if(OrderOpenPrice() < (ctrader.bid()- stopLossRange * atrVal)){
                ctrader.closeSell();
                return;
            }
			int bar = iBarShift(symbol,period,OrderOpenTime());

            if(bar> exitInteval){

				int lowBar = iLowest(symbol,period,MODE_LOW,exitInteval,0);
				double lowPrice = iLow(symbol,period,lowBar);

				if(lowBar < dayRange){

				    double value = iATR(symbol,period,atrRange,lowBar);
				    double operattionPrice =  ctrader.ask() -  stopLossRange * value ;

				    if(operattionPrice >= lowPrice){
				        ctrader.closeSell();
				    }

				}

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


