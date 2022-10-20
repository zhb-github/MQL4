#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <Trader.mqh>
//+------------------------------------------------------------------+
//| Triple screen                     |
// 三重滤网交易系统
//+------------------------------------------------------------------+


// 第一重滤网
input int firstLevelPeriod = 1440;
// 第二重滤网
input int secondLevelPeriod = 240;

input int maxRsi = 70;
input int minRsi = 30;
input int rsiRange = 3;


double input myLots = 0.01;

const string sell = "sell", buy = "buy", not = "not";


CTrader ctrader(10091);



// 获取第一重滤网的行情
string getFirstLevelMarket(){

	 double macd1 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1);
     double macd2 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2);
     double macd3 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 3);



     if(macd1 < macd2 && macd2 < macd3){
        return sell;
     }
     if(macd1 > macd2 && macd2 > macd3){
        return buy;
     }

     return not;

}


void OnTick() {


	if(OrdersTotal() == 0){

		// 判断行情
		string market = getFirstLevelMarket();
		if(market == buy){
			// 取当前rsi 值
			double rsiVal = iRSI(NULL,secondLevelPeriod,rsiRange,PRICE_CLOSE,1);
			double rsiVal1= iRSI(NULL,secondLevelPeriod,rsiRange,PRICE_CLOSE,2);

			if(rsiVal < minRsi || rsiVal1< minRsi){
				// 当前价格大于前柱的最高价格
				double preHighPrice = iHigh(NULL,secondLevelPeriod,1);
				if(ctrader.bid() > preHighPrice){
					ctrader.buy(myLots);
				}

			}

		}else if(market == sell){

			double rsiVal = iRSI(NULL,secondLevelPeriod,rsiRange,PRICE_CLOSE,1);
			double rsiVal1 = iRSI(NULL,secondLevelPeriod,rsiRange,PRICE_CLOSE,2);
            if(rsiVal > maxRsi || rsiVal1 > maxRsi){
                double preLowPrice = iLow(NULL,secondLevelPeriod,1);
                if(ctrader.ask() < preLowPrice){
                    ctrader.sell(myLots);
                }
            }
		}


	}else{

		ctrader.selectLastOrder();

		if(OrderType() == OP_BUY){

			// 止损
			int bar = iBarShift(NULL,secondLevelPeriod,OrderOpenTime());
//            int lowBar = iLowest(NULL,secondLevelPeriod,5,bar);
            double lowPrice = iLow(NULL,secondLevelPeriod,bar+1);
            if(ctrader.bid() <= lowPrice){
                ctrader.closeBuy();
            }

			// 止盈, 等待macd趋势翻转的时候进行止盈
			double macd1 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1);
            double macd2 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2);
            if(macd1< macd2){
               ctrader.closeBuy();
            }
		}

		if(OrderType() == OP_SELL){

			// 止损
			int bar = iBarShift(NULL,secondLevelPeriod,OrderOpenTime());
//			int highBar = iHighest(NULL,secondLevelPeriod,5,bar);
			double highPrice = iHigh(NULL,secondLevelPeriod,bar+1);
			if(ctrader.ask() >= highPrice){
				ctrader.closeSell();
			}

			// 止盈
			double macd1 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1);
            double macd2 = iMACD(NULL, firstLevelPeriod, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2);

            if(macd1 > macd2){
               ctrader.closeSell();
            }
		}

	}






//	ExpertRemove();

}




void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");

}


int OnInit() {

	return 0;

}



void OnTimer(){


}


