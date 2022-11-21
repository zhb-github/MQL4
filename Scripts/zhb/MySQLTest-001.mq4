//+------------------------------------------------------------------+
//|                                                    MySQL-001.mq4 |
//|                                   Copyright 2014, Eugene Lugovoy |
//|                                        http://www.fxcodexlab.com |
//| Test connections to MySQL. Reaching limit (DEMO)                 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Eugene Lugovoy"
#property link      "http://www.fxcodexlab.com"
#property version   "1.00"
#property strict


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{

	double spread = MarketInfo(NULL,MODE_SPREAD);

	printf("current spread : "+ spread);

}
//+------------------------------------------------------------------+
