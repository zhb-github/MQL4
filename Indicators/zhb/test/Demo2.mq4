//+------------------------------------------------------------------+
//|                                                        Demo2.mq4 |
//|                                                         jiumozhi |
//|                                               1025037674@163.com |
//+------------------------------------------------------------------+
#property copyright "jiumozhi"
#property link      "1025037674@163.com"
#property version   "1.00"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Crimson
#property indicator_color2 RoyalBlue

extern int barsToProcess =10000;

double ExtMapBuffer1[];
double ExtMapBuffer2[];



int OnInit()
{
	// 设置类型为箭头
	SetIndexStyle(0,DRAW_ARROW);
	// 设置第0个索引的箭头 ，箭头代码为 236
	SetIndexArrow(0,236);
	SetIndexBuffer(0,ExtMapBuffer1);
	SetIndexEmptyValue(0,0.0);

    SetIndexStyle(1,DRAW_ARROW);
	SetIndexArrow(1,238);
	SetIndexBuffer(1,ExtMapBuffer2);
	SetIndexEmptyValue(1,0.0);

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
	int countedBars = IndicatorCounted();

	if(countedBars >0){
		countedBars--;
	}

	int limit = Bars - countedBars;

	if(limit > barsToProcess){
		limit = barsToProcess;
	}

	for(int i =0; i< limit; i++){

		double randomValue = iCustom(NULL,0,"zhb/FirstIndicator",barsToProcess,0,i);

		if(randomValue > 800.0){
			ExtMapBuffer1[i] = High[i] + 10* Point;
		}else{
			ExtMapBuffer2[i] = 0.0;
		}

		if(randomValue < 200.0){
			ExtMapBuffer2[i] = Low[i] - 20*Point;
		}else{
			ExtMapBuffer2[i] = 0.0;
		}

	}

//--- return value of prev_calculated for next call
   return(0);
  }
//+------------------------------------------------------------------+
