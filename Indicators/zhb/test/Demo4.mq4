//+------------------------------------------------------------------+
//|                                           TemplateIndicators.mq4 |
//|                                                         jiumozhi |
//|                                               1025037674@163.com |
//+------------------------------------------------------------------+
#property copyright "jiumozhi"
#property link      "1025037674@163.com"
#property version   "1.00"
#property strict
#property indicator_separate_window
#property indicator_minimum 1
#property indicator_maximum 10
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

bool initFinished = false;

int OnInit()
  {
//--- indicator buffers mapping
   
//	ObjectsDeleteAll();
   // clear the chart before drawing


   // change the correlation of sides
 //  ObjectSet("ellipse",OBJPROP_COLOR,Gold);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

	if(initFinished == false){

		string niceLine = "NiceLine";

		IndicatorShortName(niceLine);

		int windowIndex = WindowFind(niceLine);

		if(windowIndex < 0 ){
			printf("Can't find window");
			return 0;
		}
		string line = "line";
		ObjectCreate(line,OBJ_HLINE,windowIndex,0,5,0);

		ObjectSet(line,OBJPROP_COLOR,GreenYellow);
		ObjectSet(line,OBJPROP_WIDTH, 3);

		WindowRedraw();

		initFinished = true;

	}


   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
