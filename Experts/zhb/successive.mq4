#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| ea 模板 连续上涨或者下跌的K线，几次后直接反向操作                    |
//+------------------------------------------------------------------+

#include <Trader.mqh>

input int marketCount = 7;
input int period = 1440;

const string buyMarket = "buy", sellMarket = "sell";

input double myLots = 0.01;

CTrader ctrader(1009);

int OnInit() {

	return 0;

}





void OnTick() {


	if(OrdersTotal() == 0){

		if(getMarket() == buyMarket){
			ctrader.buy(myLots);
		}
		if(getMarket() == sellMarket){
			ctrader.sell(myLots);
		}

	}else{

		ctrader.selectLastOrder();

		int bar = iBarShift(NULL,period,OrderOpenTime());
        	                // 大于定时退出时间
        if(bar >= 1){
            ctrader.closeAll();
        }

	}


}

// 连续下跌或者上涨之后，直接反向购买行情
string getMarket () {

	bool upFlag = true;
	bool downFlag = true;
	for(int i = 1; i <= marketCount ;i++ ) {
		// 上涨
		if(Open[i] < Close[i]){
	        downFlag = false;
    	}
		// 下跌
		if(Open[i] > Close[i]){
    		upFlag = false;
	    }
	}

	if(upFlag){
		return sellMarket;
	}
	if(downFlag){
		return buyMarket;
	}

	return "noMarket";

}



void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");

}

void OnTimer(){


}


