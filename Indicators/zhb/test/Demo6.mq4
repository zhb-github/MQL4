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


	string labelName = "labelName";
	for(int x = 0; x< 9; x++){
		for(int y=0; y<3; y++){

			string newLabelName = labelName + x+ y;
			ObjectCreate(newLabelName,OBJ_LABEL,0,0,0,0,0);

			ObjectSet(newLabelName,OBJPROP_XDISTANCE, x* 20);
			ObjectSet(newLabelName,OBJPROP_YDISTANCE,y*20);

//			ObjectSetText(newLabelName,CharToStr(110),20,NULL,Gold);

			ObjectSet(newLabelName,OBJPROP_STYLE, 110);
		}
	}

   return(rates_total);
}
//+------------------------------------------------------------------+
