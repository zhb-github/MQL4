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

// 创建一个label

	ObjectCreate("signal",OBJ_BUTTON,0,0,0,0,0);
       ObjectSet("signal",OBJPROP_XDISTANCE,50);
       ObjectSet("signal",OBJPROP_YDISTANCE,50);

       // use symbols from the Wingdings font
       ObjectSet("signal",CharToStr(164),60,"Wingdings",Gold);



   
   return(rates_total);
}
//+------------------------------------------------------------------+
