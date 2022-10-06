//+------------------------------------------------------------------+
//|                                              creatingEllipse.mq4 |
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
   ObjectsDeleteAll();
   // ������� ������ ����� ����������
   
   ObjectCreate("ellipse",OBJ_ELLIPSE,0,Time[100],Low[100],Time[0],High[0]);
   
   ObjectSet("ellipse",OBJPROP_SCALE,1.0);
   // �������� ����������� ������
   ObjectSet("ellipse",OBJPROP_COLOR,Gold);
   // ������ � ���� ��������

   return(0);
}
//+------------------------------------------------------------------+