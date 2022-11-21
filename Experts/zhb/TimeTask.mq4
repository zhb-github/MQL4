#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <Trader.mqh>
//+------------------------------------------------------------------+
//| 定时进行买入卖出                |
//+------------------------------------------------------------------+


input int magicNumber = 0;

CTrader ctrader(magicNumber);

enum RUN_MODE_EUNM {BuyOnlyMode, SellOnlyMode};
const input RUN_MODE_EUNM RUN_MODE=BuyOnlyMode;

input int  startWeek = 1;
input int startHour = 1;
input int startMin = 1;


input int  endWeek = 1;
input int endHour = 1;
input int endMin = 1;


input double myLots = 0.01;
input double maxStopLoss = -60.0;

int OnInit() {

	return 0;

}

void OnTick() {

	if(!IsTradeAllowed()) {
	    // Print("trade is not allowed");
	    return;
	}

	int orderCount = ctrader.buyCount + ctrader.sellCount;

	if(orderCount == 0){
		if( DayOfWeek() == startWeek){

			if(Hour()  == startHour){
				if(Minute() >= startMin){

					if(RUN_MODE == BuyOnlyMode){
						ctrader.buy(myLots);
					}else{
						ctrader.sell(myLots);
					}
				}
			}
		}

	}else{

		ctrader.selectLastOrder();

		if(OrderProfit()< maxStopLoss){
			 ctrader.closeAll();
		}

		if( DayOfWeek() == endWeek){

	        if(Hour()  == endHour){
	            if(Minute() >= endMin){
	                ctrader.closeAll();
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


