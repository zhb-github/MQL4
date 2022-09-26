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

#include <MQLMySQL.mqh>

string INI;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
	int DBConnection = MySqlConnect("localhost", "root", "123456", "zhb", 3306, "", 0);
	if (DBConnection==-1)
	{
	 Print("Error #", MySqlErrorNumber, ": ", MySqlErrorDescription);
	 
	}
	else Print ("Connected!");

}
//+------------------------------------------------------------------+
