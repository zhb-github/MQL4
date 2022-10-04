//+------------------------------------------------------------------+
//|                                                          DMA.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <MovingAverages.mqh>
// #property indicator_separate_window
#property indicator_chart_window

#property  indicator_buffers 2
const input int fastPeriod = 20;
const input int slowPeriod = 60;
double fastBuffer[];
double slowBuffer[];
double diffBuffer[];

int OnInit() {
  IndicatorDigits(Digits);
  IndicatorShortName("DMA");

  SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,1,Red);
  SetIndexBuffer(0,fastBuffer);
  SetIndexLabel(0,"Fast("+string(fastPeriod)+")");

  SetIndexStyle(1,DRAW_LINE,STYLE_SOLID,1,RoyalBlue);
  SetIndexBuffer(1,slowBuffer);
  SetIndexLabel(1,"Slow("+string(slowPeriod)+")");
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
    
    ExponentialMAOnBuffer(rates_total,prev_calculated,0,fastPeriod,close,fastBuffer);
    ExponentialMAOnBuffer(rates_total,prev_calculated,0,slowPeriod,close,slowBuffer);

    return(rates_total);
  }
//+------------------------------------------------------------------+
