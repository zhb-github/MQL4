#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| ea 模板                     |
//+------------------------------------------------------------------+

int OnInit() {


	EventSetTimer(60);
	return 0;

}

void OnTick() {




}


void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");

}

void OnTimer(){

	double spread = MarketInfo(NULL,MODE_SPREAD);

    printf("current spread : "+ spread);


}


