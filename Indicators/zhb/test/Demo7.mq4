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

#property indicator_buffers 4


input int maxPeriod = 20;
input int  minPeriod = 10;

double maxHighBuffer[];
double maxLowBuffer[];
double minHighBuffer[];
double minLowBuffer[];


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
//--- indicator buffers mapping
	//

	IndicatorDigits(Digits);
	IndicatorShortName("breakRange");

	// 设置第一条线
	SetIndexBuffer(0,maxHighBuffer);
	SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,1,clrRed);
	SetIndexLabel(0,"maxHigh");


	SetIndexBuffer(1,maxLowBuffer);
	SetIndexStyle(1,DRAW_LINE,STYLE_SOLID,1,clrGreen);
	SetIndexLabel(1,"maxLow");


	SetIndexBuffer(2,minHighBuffer);
	SetIndexStyle(2,DRAW_LINE,STYLE_SOLID,1,clrBlue);
	SetIndexLabel(2,"minHigh");

	SetIndexBuffer(3,minLowBuffer);
	SetIndexStyle(3,DRAW_LINE,STYLE_SOLID,1,clrWhite);
	SetIndexLabel(3,"minLow");


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
	// 使用正向数组
	ArraySetAsSeries(maxHighBuffer,false);
	ArraySetAsSeries(maxLowBuffer,false);
	ArraySetAsSeries(minHighBuffer,false);
	ArraySetAsSeries(minLowBuffer,false);


	// 从哪里开始循环
	int temp = maxPeriod < minPeriod? maxPeriod: minPeriod;
	int i = temp > prev_calculated? prev_calculated: temp;

	for(;i < rates_total; i++){

		if(i > maxPeriod){

			int highBar = iHighest(NULL,0,MODE_HIGH,maxPeriod,rates_total-i);
			maxHighBuffer[i] = iHigh(NULL,0, highBar);

			int lowBar = iLowest(NULL,0,MODE_LOW,maxPeriod,rates_total -i);
			maxLowBuffer[i] = iLow(NULL,0,lowBar);
		}

		if(i> minPeriod){

			int highBar = iHighest(NULL,0,MODE_HIGH,minPeriod,rates_total-i);
            minHighBuffer[i] = iHigh(NULL,0, highBar);

            int lowBar = iLowest(NULL,0,MODE_LOW,minPeriod,rates_total -i);
            minLowBuffer[i] = iLow(NULL,0,lowBar);
		}


	}



return(rates_total);
}
//+------------------------------------------------------------------+
