//+------------------------------------------------------------------+
//|                                           TemplateIndicators.mq4 |
//|                                                         jiumozhi |
//|                                               1025037674@163.com |
//+------------------------------------------------------------------+
#property copyright "jiumozhi"
#property link      "1025037674@163.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
	ObjectsDeleteAll();
   // clear the chart before drawing

   ObjectCreate("ellipse",OBJ_ELLIPSE,0,Time[100],Low[100],Time[0],High[0]);

   ObjectSet("ellipse",OBJPROP_SCALE,1.0);
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
//---
//	double higPrice = iHigh(Symbol(),PERIOD_D1,1);
//	double lowPrice = iLow(Symbol(),PERIOD_D1,1);
//
//	string highLine = "highLine";
//	string lowLine = "lowLine";
//	ObjectCreate(highLine,OBJ_HLINE,0,0,higPrice);
//	ObjectCreate(lowLine,OBJ_HLINE,0,0,lowPrice);
//
//
//	ObjectSet(highLine,OBJPROP_COLOR, Green);
//	ObjectSet(highLine,OBJPROP_WIDTH,3);
//
//	ObjectSet(lowLine,OBJPROP_COLOR,White);
//	ObjectSet(lowLine,OBJPROP_STYLE,STYLE_DOT);

//ObjectCreate("ellipse",OBJ_ELLIPSE,0,Time[100],Low[100],Time[0],High[0]);
//	ObjectsDeleteAll();
//	ObjectCreate("ellipse",OBJ_ELLIPSE,0,time[100],low[100],time[0],high[0]);
//	ObjectSet("ellipse",OBJPROP_SCALE,1.0);
//	ObjectSet("ellipse",OBJPROP_COLOR,Gold);


   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
