//+------------------------------------------------------------------+
//|                                                creatingLines.mq4 |
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
   // ��� �������� ������� ���������� ������������ ���� ��:
   // * ��������� ���������� �����������, � ��� - ��� Symbol() - 
   //   �������� ���������� ����������
   // * ��������� �������, � ��� - ��� PERIOD_D1 (�������)
   // * ��������� ����, � ��� - ��� 0, ��������� ���

   ObjectCreate("highLine",OBJ_HLINE,0,0,price);
   // ���������� ��� ���������: 
   // "highLine" - ���������� �������� �������
   // OBJ_HLINE - ��� �������, ������� ������������� �������������� �����
   // 0 - ������ ������ � ������� ���� (������ ���)
   // 0 - ���������� �� ��� � (�����), ��� ��� �� ������� ��������������
   //     �����, �� ��������� ��� ���������� �� �����
   // price - ���������� �� ��� Y (����). � ��� ��� ������������ ����
   
   price=iLow(Symbol(),PERIOD_D1,0);
   // ������� �� ���������� ��������� ��������� � iHigh, �� ����������
   // ����������� ����
   
   ObjectCreate("lowLine",OBJ_HLINE,0,0,price);

   return(0);
  }
//+------------------------------------------------------------------+