//+------------------------------------------------------------------+
//|                                                    MySQL-002.mq4 |
//|                                   Copyright 2014, Eugene Lugovoy |
//|                                        http://www.fxcodexlab.com |
//| Table creation (DEMO)                                            |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Eugene Lugovoy."
#property link      "http://www.fxcodexlab.com"
#property version   "1.00"
#property strict



string INI;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
	string randomValue = iCustom(NULL,0,"Qushiv3_无限",10,0);

	printf("randomValue: "+randomValue);

}
//+------------------------------------------------------------------+
