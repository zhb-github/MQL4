//+------------------------------------------------------------------+
//|                                                 settingLines.mq4 |
//|                                                     Antonuk Oleg |
//|                                            antonukoleg@gmail.com |
//+------------------------------------------------------------------+
#property copyright "Antonuk Oleg"
#property link      "antonukoleg@gmail.com"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int  start()
{
   double price=iHigh(Symbol(),PERIOD_D1,0);

   ObjectCreate("highLine",OBJ_HLINE,0,0,price);
   price=iLow(Symbol(),PERIOD_D1,0);
   ObjectCreate("lowLine",OBJ_HLINE,0,0,price);
   
   ObjectSet("highLine",OBJPROP_COLOR,LimeGreen);
   // �������� ���� ������� �����
   ObjectSet("highLine",OBJPROP_WIDTH,3);
   // ������ ����� ����� �������� � 3 �������
   
   ObjectSet("lowLine",OBJPROP_COLOR,Crimson);
   // �������� ���� ������ �����
   ObjectSet("lowLine",OBJPROP_STYLE,STYLE_DOT);
   // ������ ����� ����� �������� � 3 �������   

   return(0);
}
//+------------------------------------------------------------------+