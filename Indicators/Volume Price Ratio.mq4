//+------------------------------------------------------------------+
//|                                                          MA5.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#property indicator_separate_window
// #property indicator_chart_window

#property  indicator_buffers 1
double vprBuffer[];

int OnInit()
{
   IndicatorDigits(Digits);
   IndicatorShortName("Volume Price Ratio");

   
   SetIndexStyle(0,DRAW_HISTOGRAM,STYLE_SOLID,2,Silver);
   SetIndexBuffer(0,vprBuffer);
   SetIndexLabel(0,"vpr");
   
   return(INIT_SUCCEEDED);
}

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
   // if(rates_total==prev_calculated) return(rates_total); // skip
   // return 0;
   ArraySetAsSeries(vprBuffer,false);
   ArraySetAsSeries(open,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(tick_volume,false);

   // printf("rates_total=%g, prev_calculated=%g", rates_total, prev_calculated);

   int i=prev_calculated==0 ? 0 : prev_calculated-1;
   for(;i<rates_total;i++) {
      double priceDiff=MathAbs(open[i]-close[i]);
      vprBuffer[i]=tick_volume[i]/(priceDiff*pow(10, Digits())+100);
   }
   return(rates_total);
}
