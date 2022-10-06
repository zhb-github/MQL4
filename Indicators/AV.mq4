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

#property  indicator_buffers 3
input int maPeriod=60;
double maBuffer[];
double upBuffer[];
double downBuffer[];

int OnInit()
{
   IndicatorDigits(Digits);
   IndicatorShortName("Average Volume (" + string(maPeriod) + ")");
   
   SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,1,RoyalBlue);
   SetIndexBuffer(0,maBuffer);
   SetIndexLabel(0,"ma");
   
   SetIndexStyle(1,DRAW_HISTOGRAM,STYLE_SOLID,2,Green);
   SetIndexBuffer(1,upBuffer);
   SetIndexLabel(1,"up");
   
   SetIndexStyle(2,DRAW_HISTOGRAM,STYLE_SOLID,2,Red);
   SetIndexBuffer(2,downBuffer);
   SetIndexLabel(2,"down");
   
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
   ArraySetAsSeries(maBuffer,false);
   ArraySetAsSeries(upBuffer,false);
   ArraySetAsSeries(downBuffer,false);
   ArraySetAsSeries(open,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(tick_volume,false);

   // printf("rates_total=%g, prev_calculated=%g", rates_total, prev_calculated);

   double dSmoothFactor=2.0/(1.0+maPeriod);
   int i=prev_calculated==0 ? 0 : prev_calculated-1;
   for(;i<rates_total;i++) {
      if(open[i]<=close[i]) {
         upBuffer[i]=double(tick_volume[i]);
         downBuffer[i]=0;
      }
      else {
         upBuffer[i]=0;
         downBuffer[i]=double(tick_volume[i]);
      }
      if(i>0) maBuffer[i]=tick_volume[i]*dSmoothFactor+maBuffer[i-1]*(1.0-dSmoothFactor);
   }
   return(rates_total);
}
