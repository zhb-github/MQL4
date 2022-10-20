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
//---
   
//   testIndicatorCounted();

//   Alert(TerminalPath());

   //Alert(AccountServer());

// Alert(OrdersHistoryTotal());

	Alert(TimeDayOfWeek(TimeCurrent()));

//	int a = 0.00080 * MathPow(10,5);
//	Alert("a: "+ a);
//    Alert(TimeGMTOffset());

  }
//+------------------------------------------------------------------+


void testIndicatorCounted() {

	int a = IndicatorCounted();
	
	Alert(a);
}