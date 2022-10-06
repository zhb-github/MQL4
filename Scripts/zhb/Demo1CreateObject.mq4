//+------------------------------------------------------------------+
//|                                                        Test1.mq4 |
//|                                                         jiumozhi |
//|                                               1025037674@163.com |
//+------------------------------------------------------------------+
#property copyright "jiumozhi"
#property link      "1025037674@163.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {



	double highPrice = iHigh(Symbol(),PERIOD_D1,1);

	double lowPrice = iLow(Symbol(),PERIOD_D1,1);

	bool createHighLine = ObjectCreate("highLine",OBJ_HLINE,0,0,highPrice);

	bool createLowLine = ObjectCreate("lowLine",OBJ_HLINE,0,0,lowPrice);


  }

