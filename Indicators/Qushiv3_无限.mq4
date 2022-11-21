//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "mrdfx";
#property link "info@bullbearfinance.com";
#property version "1.00";
#property strict
#include <Arrays\ArrayDouble.mqh>
#include <Indicators\Trend.mqh>
#property indicator_chart_window

#property indicator_buffers 2

#property indicator_color1 Lime
#property indicator_label1 "Beast Super Signal Buy"
#property indicator_type1 DRAW_ARROW
#property indicator_width1 2

#property indicator_color2 Red
#property indicator_label2 "Beast Super Signal Sell"
#property indicator_type2 DRAW_ARROW
#property indicator_width2 2


extern int SigDepth = 60; // Signal Depth
extern int SigDeviation = 5; // Signal Deviation
extern int SigBackstep = 3; // Signal Backstep
extern int StohLen = 7; // Stohastic Len
extern double StohFilter; // Stohastic Filter
extern double StohOverbought = 70; // Stohastic Overbought Level
extern double StohOversold = 30; // Stohastic Oversold Level
extern int TrendPeriod = 10; // MA Trend Line Period
extern ENUM_MA_METHOD TrendMaMethod = MODE_SMA; // MA Trend Line Method
extern ENUM_APPLIED_PRICE TrendPrice = PRICE_CLOSE; // MA Trend Line Applied Price
extern int MAPeriod = 15; // MA Period
extern int MAShift; // MA Shift
extern ENUM_MA_METHOD MAMethod = MODE_SMA; // MA Method
extern ENUM_APPLIED_PRICE MAAppliedPrice = PRICE_CLOSE; // MA Applied Price
extern bool UseAlert = true; // Use Alert
extern bool UsePush = true; // Use Push
extern bool UseMail = true; // Use Mail
extern int ArrowShift = 50; // Arrow shift at points


struct SLast
  {
public:
   datetime          m_0;
   double            m_8;
  };


bool Gb_0000;
long returned_l;
int Gi_0001;
int Gi_0002;
int Gi_0003;
int Gi_0004;
int Gi_0005;
int Gi_0006;
int Gi_0007;
int Gi_0008;

int returned_i;
int Gi_0000;
double Gd_0001;
double Gd_0002;
double Gd_0004;
double Gd_0003;
string Is_02B8;
bool Gb_0006;
double Gd_0005;
double Gd_0006;
bool Gb_0008;
double Gd_0007;
double Gd_0008;
int Gi_0009;
bool Gb_000A;
double Gd_0009;
int Gi_000A;
bool Gb_000B;
double Gd_000A;
int Gi_000B;
bool Gb_000C;
double Gd_000B;
int Gi_000C;
bool Gb_000D;
double Gd_000C;
int Gi_000D;
bool Gb_000E;
double Gd_000D;
int Gi_000E;
double Ind_004;
double Gd_000F;
double Ind_000;
double Gd_000E;
int Gi_0010;
double Gd_0010;
int Gi_000F;
int Gi_0011;
bool Gb_0012;
double Gd_0011;
int Gi_0012;
bool Gb_0013;
double Gd_0012;
int Gi_0013;
bool Gb_0014;
double Gd_0013;
int Gi_0014;
bool Gb_0015;
double Gd_0014;
int Gi_0015;
bool Gb_0016;
double Gd_0015;
int Gi_0016;
double Gd_0016;
double Gd_0017;
int Gi_0018;
double Gd_0018;
int Gi_0017;
int Ii_0624;
double Gd_0000;
bool Gb_0011;
bool Gb_0019;
int Gi_0019;
int Gi_001A;
double Gd_001A;
double Gd_0019;
int Gi_001B;
double Gd_001B;
bool Gb_0003;
bool Gb_0009;
double Ind_002;
int Gi_0133;
double Gd_0134;
int Gi_0136;
double Gd_0137;
bool Gb_0139;
int Gi_0139;
double Gd_013A;
bool Gb_013C;
int Gi_013C;
double Gd_013D;
int Gi_013F;
double Gd_0140;
double Gd_0142;
int Gi_0143;
int Gi_0144;
double Gd_0144;
int Gi_0142;
double Gd_0145;
bool Gb_0147;
int Gi_0147;
int Gi_0148;
double Gd_0148;
int Gi_0149;
double Gd_014A;
bool Gb_014C;
int Gi_014C;
int Gi_014D;
double Gd_014D;
int Gi_0150;
double Gd_0151;
int Gi_0153;
double Gd_0153;
int Gi_0154;
double Gd_0155;
int Gi_0157;
double Gd_0157;
int Gi_0158;
double Gd_0159;
int Gi_015B;
double Gd_015B;
int Gi_015C;
int Gi_015D;
double Gd_015D;
bool Gb_015E;
double Gd_015C;
int Gi_015E;
double Gd_015E;
int Gi_015F;
int Gi_0160;
double Gd_0160;
bool Gb_0161;
double Gd_015F;
int Gi_0161;
double Gd_0161;
int Gi_0162;
int Gi_0163;
double Gd_0163;
bool Gb_0164;
double Gd_0162;
int Gi_0164;
double Gd_0164;
int Gi_0165;
double Gd_0165;
int Gi_015A;
double Gd_015A;
int Gi_0156;
double Gd_0156;
int Gi_0152;
double Gd_0152;
int Gi_014B;
double Gd_014B;
int Gi_0146;
double Gd_0146;
int Gi_0141;
double Gd_0141;
int Gi_013E;
double Gd_013E;
int Gi_014E;
int Gi_014F;
double Gd_014F;
int Gi_013B;
double Gd_013B;
int Gi_0138;
double Gd_0138;
int Gi_0135;
double Gd_0135;
double Gd_001C;
int Gi_001E;
double Gd_001F;
bool Gb_0021;
int Gi_0021;
double Gd_0022;
double Gd_0024;
int Gi_0028;
int Gi_0029;
double Gd_0029;
int Gi_0024;
double Gd_002A;
int Gi_002C;
int Gi_002D;
double Gd_002D;
int Gi_002E;
int Gi_002F;
double Gd_002E;
double Gd_002F;
double Gd_0030;
int Gi_0031;
double Gd_0031;
int Gi_0032;
int Gi_0033;
double Gd_0033;
int Gi_0030;
double Gd_0034;
int Gi_0036;
double Gd_0037;
double Gd_0039;
int Gi_003A;
int Gi_003B;
double Gd_003B;
int Gi_0039;
double Gd_003C;
int Gi_003E;
double Gd_003F;
double Gd_0041;
int Gi_0042;
double Gd_0043;
int Gi_0045;
double Gd_0046;
int Gi_0048;
int Gi_0049;
double Gd_0049;
int Gi_0041;
double Gd_004A;
int Gi_004C;
double Gd_004D;
double Gd_004F;
int Gi_0050;
double Gd_0051;
int Gi_0053;
double Gd_0054;
int Gi_0056;
int Gi_0057;
double Gd_0057;
int Gi_004F;
double Gd_0058;
double Gd_005A;
int Gi_005B;
double Gd_005C;
double Gd_005E;
int Gi_005F;
int Gi_0060;
double Gd_0060;
int Gi_005E;
double Gd_0061;
int Gi_0063;
double Gd_0064;
double Gd_0066;
int Gi_0067;
double Gd_0068;
int Gi_006A;
double Gd_006B;
int Gi_006D;
int Gi_006E;
double Gd_006E;
int Gi_0066;
double Gd_006F;
int Gi_0071;
double Gd_0072;
double Gd_0074;
int Gi_0075;
double Gd_0076;
int Gi_0078;
double Gd_0079;
int Gi_007B;
int Gi_007C;
double Gd_007C;
int Gi_0074;
double Gd_007D;
double Gd_007F;
int Gi_0080;
double Gd_0081;
double Gd_0083;
int Gi_0084;
int Gi_0085;
double Gd_0085;
int Gi_0083;
double Gd_0086;
int Gi_0088;
double Gd_0089;
double Gd_008B;
int Gi_008C;
double Gd_008D;
int Gi_008F;
double Gd_0090;
int Gi_0092;
int Gi_0093;
double Gd_0093;
int Gi_008B;
double Gd_0094;
int Gi_0096;
double Gd_0097;
double Gd_0099;
int Gi_009A;
double Gd_009B;
int Gi_009D;
double Gd_009E;
int Gi_00A0;
int Gi_00A1;
double Gd_00A1;
int Gi_0099;
double Gd_00A2;
double Gd_00A4;
int Gi_00A5;
double Gd_00A6;
double Gd_00A8;
int Gi_00A9;
int Gi_00AA;
double Gd_00AA;
int Gi_00A8;
double Gd_00AB;
int Gi_00AD;
double Gd_00AE;
double Gd_00B0;
int Gi_00B1;
double Gd_00B2;
int Gi_00B4;
double Gd_00B5;
double Gd_00B7;
int Gi_00B8;
int Gi_00B9;
double Gd_00B9;
int Gi_00B7;
double Gd_00BA;
int Gi_00BC;
double Gd_00BD;
double Gd_00BF;
int Gi_00C0;
double Gd_00C1;
int Gi_00C3;
double Gd_00C4;
int Gi_00C6;
int Gi_00C7;
double Gd_00C7;
int Gi_00BF;
double Gd_00C8;
double Gd_00CA;
int Gi_00CB;
double Gd_00CC;
double Gd_00CE;
int Gi_00CF;
int Gi_00D0;
double Gd_00D0;
int Gi_00CE;
double Gd_00D1;
int Gi_00D3;
double Gd_00D4;
double Gd_00D6;
int Gi_00D7;
double Gd_00D8;
int Gi_00DA;
double Gd_00DB;
int Gi_00DD;
int Gi_00DE;
double Gd_00DE;
int Gi_00D6;
double Gd_00DF;
int Gi_00E1;
double Gd_00E2;
double Gd_00E4;
int Gi_00E5;
double Gd_00E6;
int Gi_00E8;
double Gd_00E9;
int Gi_00EB;
int Gi_00EC;
double Gd_00EC;
int Gi_00E4;
double Gd_00ED;
double Gd_00EF;
int Gi_00F0;
double Gd_00F1;
double Gd_00F3;
int Gi_00F4;
int Gi_00F5;
double Gd_00F5;
int Gi_00F3;
double Gd_00F6;
int Gi_00F8;
double Gd_00F9;
double Gd_00FB;
int Gi_00FC;
double Gd_00FD;
int Gi_00FF;
double Gd_0100;
int Gi_0102;
int Gi_0103;
double Gd_0103;
int Gi_00FB;
double Gd_0104;
int Gi_0106;
double Gd_0107;
double Gd_0109;
int Gi_010A;
double Gd_010B;
int Gi_010D;
double Gd_010E;
int Gi_0110;
int Gi_0111;
double Gd_0111;
int Gi_0109;
double Gd_0112;
double Gd_0114;
int Gi_0115;
double Gd_0116;
double Gd_0118;
int Gi_0119;
int Gi_011A;
double Gd_011A;
int Gi_0118;
double Gd_011B;
int Gi_011D;
double Gd_011E;
bool Gb_0120;
int Gi_0120;
double Gd_0121;
int Gi_0123;
double Gd_0124;
bool Gb_0126;
int Gi_0126;
int Gi_0127;
double Gd_0127;
int Gi_0128;
double Gd_0129;
int Gi_012B;
double Gd_012C;
bool Gb_012E;
int Gi_012E;
double Gd_012F;
bool Gb_0131;
int Gi_0131;
int Gi_0132;
double Gd_0132;
int Gi_0130;
double Gd_0130;
int Gi_012D;
double Gd_012D;
int Gi_012A;
double Gd_012A;
int Gi_0125;
double Gd_0125;
int Gi_0122;
double Gd_0122;
int Gi_011F;
double Gd_011F;
int Gi_011C;
double Gd_011C;
int Gi_0117;
double Gd_0117;
int Gi_0113;
double Gd_0113;
int Gi_010F;
double Gd_010F;
int Gi_010C;
double Gd_010C;
int Gi_0108;
double Gd_0108;
int Gi_0105;
double Gd_0105;
int Gi_0101;
double Gd_0101;
int Gi_00FE;
double Gd_00FE;
int Gi_00FA;
double Gd_00FA;
int Gi_00F7;
double Gd_00F7;
int Gi_00F2;
double Gd_00F2;
int Gi_00EE;
double Gd_00EE;
int Gi_00EA;
double Gd_00EA;
int Gi_00E7;
double Gd_00E7;
int Gi_00E3;
double Gd_00E3;
int Gi_00E0;
double Gd_00E0;
int Gi_00DC;
double Gd_00DC;
int Gi_00D9;
double Gd_00D9;
int Gi_00D5;
double Gd_00D5;
int Gi_00D2;
double Gd_00D2;
int Gi_00CD;
double Gd_00CD;
int Gi_00C9;
double Gd_00C9;
int Gi_00C5;
double Gd_00C5;
int Gi_00C2;
double Gd_00C2;
int Gi_00BE;
double Gd_00BE;
int Gi_00BB;
double Gd_00BB;
int Gi_00B6;
double Gd_00B6;
int Gi_00B3;
double Gd_00B3;
int Gi_00AF;
double Gd_00AF;
int Gi_00AC;
double Gd_00AC;
int Gi_00A7;
double Gd_00A7;
int Gi_00A3;
double Gd_00A3;
int Gi_009F;
double Gd_009F;
int Gi_009C;
double Gd_009C;
int Gi_0098;
double Gd_0098;
int Gi_0095;
double Gd_0095;
int Gi_0091;
double Gd_0091;
int Gi_008E;
double Gd_008E;
int Gi_008A;
double Gd_008A;
int Gi_0087;
double Gd_0087;
int Gi_0082;
double Gd_0082;
int Gi_007E;
double Gd_007E;
int Gi_007A;
double Gd_007A;
int Gi_0077;
double Gd_0077;
int Gi_0073;
double Gd_0073;
int Gi_0070;
double Gd_0070;
int Gi_006C;
double Gd_006C;
int Gi_0069;
double Gd_0069;
int Gi_0065;
double Gd_0065;
int Gi_0062;
double Gd_0062;
int Gi_005D;
double Gd_005D;
int Gi_0059;
double Gd_0059;
int Gi_0055;
double Gd_0055;
int Gi_0052;
double Gd_0052;
int Gi_004E;
double Gd_004E;
int Gi_004B;
double Gd_004B;
int Gi_0047;
double Gd_0047;
int Gi_0044;
double Gd_0044;
int Gi_0040;
double Gd_0040;
int Gi_003D;
double Gd_003D;
int Gi_0038;
double Gd_0038;
int Gi_0035;
double Gd_0035;
int Gi_002B;
double Gd_002B;
int Gi_0023;
double Gd_0023;
int Gi_0025;
double Gd_0026;
int Gi_0027;
double Gd_0027;
int Gi_0020;
double Gd_0020;
int Gi_001D;
double Gd_001D;
bool Gb_0004;

bool Gb_0010;
long Gl_0012;
long Gl_0015;
bool Gb_0018;

double Id_0000[];
double Id_0034[];
double Id_0068[];
double Id_009C[];
double Id_00D0[];
double Id_0104[];
double Id_0138[];
double Id_016C[];
double Id_01A0[];
double Id_01D4[];
double Id_0208[];

double Id_0694[];
SLast Input_SLast_298;
SLast Input_SLast_2A8;
/*
Input_Pointer_00000240.m_16 = 0;
Input_Pointer_00000240.m_24 = 0;
Input_Pointer_00000240.m_16 = 0;
Input_Pointer_00000240.m_24 = 0;
Input_CiMA_240 = "";
Input_CiMA_240.m_44 = 0;
Input_CiMA_240.m_48 = 0;
Input_CiMA_240 = "";
Input_CiMA_240.m_64 = -1;
Input_CiMA_240.m_68 = -1;
Input_CiMA_240.m_72 = -1;
Input_CiMA_240.m_76 = -1;
Input_CiMA_240.m_80 = -1;
Is_02B8 = NULL;
Ii_0624 = 0;
Input_Pointer_00000628.m_16 = 0;
Input_Pointer_00000628.m_24 = 0;
double Input_ArrayDouble_628.m_48[];
Input_Pointer_00000628.m_16 = 0;
Input_Pointer_00000628.m_24 = 0;
Input_ArrayDouble_628.m_32 = 16;
Input_ArrayDouble_628.m_36 = 0;
Input_ArrayDouble_628.m_40 = 0;
Input_ArrayDouble_628.m_44 = -1;
Input_ArrayDouble_628.m_100 = 0;
Input_ArrayDouble_628.m_40 = Input_ArrayDouble_628.m_56;
*/

CiMA Input_CiMA_240;
CArrayDouble Input_ArrayDouble_628;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int init()
  {
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   int Li_FFFC;
   int Li_FFF8;

   Comment("");
   Gb_0000 = true;
   if(TimeLocal() > 7825334400)
     {
      StringConcatenate(tmp_str0000, "The demonstration has expired!", "\n");
      Gb_0000 = false;
     }
   if(Gb_0000 != true)
     {
      Alert(tmp_str0000);
     }
   if(Gb_0000 != true)
     {
      Li_FFFC = 1;
      return Li_FFFC;
     }
   IndicatorBuffers(11);
   Li_FFF8 = 0;
   SetIndexBuffer(0, Id_0000, 0);
   SetIndexArrow(0, 233);
   Li_FFF8 = 1;
   SetIndexBuffer(1, Id_0034, 0);
   SetIndexArrow(1, 234);
   Li_FFF8 = 1 + 1;
   SetIndexBuffer(Li_FFF8, Id_0068, 0);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_009C, 2);
   SetIndexEmptyValue(Li_FFF8, 0);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_00D0, 2);
   SetIndexEmptyValue(Li_FFF8, 0);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_0104, 2);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_0138, 2);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_016C, 2);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_01A0, 2);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_01D4, 2);
   Li_FFF8 = Li_FFF8 + 1;
   SetIndexBuffer(Li_FFF8, Id_0208, 2);
   IndicatorShortName("Beast Super Signal");
   Gi_0001 = MAAppliedPrice;
   Gi_0002 = MAMethod;
   Gi_0003 = MAShift;
   Gi_0004 = MAPeriod;
   Gi_0005 = 0;
   tmp_str0001 = NULL;

   Input_CiMA_240.Create(tmp_str0001, (ENUM_TIMEFRAMES)Gi_0005, Gi_0004, Gi_0003, (ENUM_MA_METHOD)Gi_0002, Gi_0001);

   Li_FFFC = 0;

   return Li_FFFC;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total, const int prev_calculated, const datetime &time[], const double &open[], const double &high[], const double &low[], const double &close[], const long &tick_volume[], const long &volume[], const int &spread[])
  {
   string tmp_str0000;
   int Li_FFFC;
   int Li_FFF8;
   int Li_FFF4;
   string Ls_FFE8;
   string Ls_FFD8;

   if(prev_calculated == rates_total)
     {
      Li_FFFC = rates_total;
      return Li_FFFC;
     }
   ArraySetAsSeries(time, true);
   ArraySetAsSeries(open, true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low, true);
   ArraySetAsSeries(close, true);

   func_1206(rates_total, prev_calculated, time, open, high, low, close);
   func_1205(rates_total, prev_calculated, time, open, high, low, close);
   func_1145(rates_total, prev_calculated, time, open, high, low, close);
   if(prev_calculated == 0)
     {
      Gi_0000 = rates_total - 2;
     }
   else
     {
      Gi_0001 = rates_total - prev_calculated;
      Gi_0000 = Gi_0001;
     }
   Li_FFF8 = Gi_0000;
   Li_FFF4 = Gi_0000;
   if(Gi_0000 < 0)
      return rates_total;
   if(_StopFlag != 0)
      return rates_total;
   do
     {
      Id_0000[Li_FFF4] = 2147483647;
      Id_0034[Li_FFF4] = 2147483647;
      Gi_0003 = Li_FFF4 + 1;
      Id_0068[Li_FFF4] = Id_0068[Gi_0003];
      if(Is_02B8 != "up" && (Id_009C[Li_FFF4] != 0))
        {
         Id_0068[Li_FFF4] = 0;
        }
      if(Is_02B8 != "down" && (Id_00D0[Li_FFF4] != 0))
        {
         Id_0068[Li_FFF4] = 1;
        }
      if((Id_0068[Li_FFF4] == 0) && Is_02B8 != "up" && (Id_0104[Li_FFF4] != 2147483647) && (Id_016C[Li_FFF4] > StohOversold) && (Id_01A0[Li_FFF4] != 2147483647) && (close[Li_FFF4] > Input_CiMA_240.GetData(0, Li_FFF4)))
        {
         Gd_000F = (ArrowShift * _Point);
         Gd_000F = (low[Li_FFF4] - Gd_000F);
         Id_0000[Li_FFF4] = Gd_000F;
         Is_02B8 = "up";
         if(Li_FFF4 < 2)
           {
            tmp_str0000 = _Symbol + ", ";
            tmp_str0000 = tmp_str0000 + func_1207(_Period);
            tmp_str0000 = tmp_str0000 + ", Beast Super Signal, BUY @ ";
            tmp_str0000 = tmp_str0000 + DoubleToString(close[Li_FFF4], _Digits);
            Ls_FFE8 = tmp_str0000;
            if(UseAlert)
              {
               Alert(Ls_FFE8);
              }
            if(UsePush)
              {
               SendNotification(Ls_FFE8);
              }
            if(UseMail)
              {
               SendMail("Beast Super Signal", Ls_FFE8);
              }
           }
        }
      if((Id_0068[Li_FFF4] == 1) && Is_02B8 != "down" && (Id_0138[Li_FFF4] != 2147483647) && (Id_016C[Li_FFF4] < StohOverbought) && (Id_01D4[Li_FFF4] != 2147483647) && (close[Li_FFF4] < Input_CiMA_240.GetData(0, Li_FFF4)))
        {
         Gd_0017 = ((ArrowShift * _Point) + high[Li_FFF4]);
         Id_0034[Li_FFF4] = Gd_0017;
         Is_02B8 = "down";
         if(Li_FFF4 < 2)
           {
            tmp_str0000 = _Symbol + ", ";
            tmp_str0000 = tmp_str0000 + func_1207(_Period);
            tmp_str0000 = tmp_str0000 + ", Beast Super Signal, SELL @ ";
            tmp_str0000 = tmp_str0000 + DoubleToString(close[Li_FFF4], _Digits);
            Ls_FFD8 = tmp_str0000;
            if(UseAlert)
              {
               Alert(Ls_FFD8);
              }
            if(UsePush)
              {
               SendNotification(Ls_FFD8);
              }
            if(UseMail)
              {
               SendMail("Beast Super Signal", Ls_FFD8);
              }
           }
        }
      Li_FFF4 = Li_FFF4 - 1;
      if(Li_FFF4 < 0)
         return rates_total;
     }
   while(_StopFlag == 0);

   Li_FFFC = rates_total;

   return Li_FFFC;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int func_1145(const int Fa_i_00, const int Fa_i_01, const long &Fa_l_02[], const double &Fa_d_03[], const double &Fa_d_04[], const double &Fa_d_05[], const double &Fa_d_06[])
  {
   int Li_FFFC;
   int Li_FFF8;
   int Li_FFC0;
   int Li_FFBC;
   int Li_FFB8;

   if(Fa_i_01 == Fa_i_00)
     {
      Li_FFFC = Fa_i_00;
      return Li_FFFC;
     }
   if(Fa_i_01 == 0)
     {
      Gd_0000 = sqrt(TrendPeriod);
      Ii_0624 =(int) Gd_0000;
     }
   if(Fa_i_01 == 0)
     {
      Gi_0000 = Fa_i_00 - TrendPeriod;
     }
   else
     {
      Gi_0001 = Fa_i_00 - Fa_i_01;
      Gi_0001 = Gi_0001 + TrendPeriod;
      Gi_0001 = Gi_0001 + 1;
      Gi_0000 = Gi_0001;
     }
   Li_FFF8 = Gi_0000;
   double Ld_FFC4[];
   ArrayResize(Id_0694, Gi_0000, 0);
   ArraySetAsSeries(Id_0694, true);
   ArrayResize(Ld_FFC4, Gi_0000, 0);
   ArraySetAsSeries(Ld_FFC4, true);
   Li_FFC0 = 0;
   if(Gi_0000 > 0)
     {
      do
        {
         Gd_0001 = (iMA(NULL, 0, (TrendPeriod / 2), 0, TrendMaMethod, TrendPrice, Li_FFC0) * 2);
         Gd_0001 = (Gd_0001 - iMA(NULL, 0, TrendPeriod, 0, TrendMaMethod, TrendPrice, Li_FFC0));
         Id_0694[Li_FFC0] = Gd_0001;
         Li_FFC0 = Li_FFC0 + 1;
        }
      while(Li_FFC0 < Li_FFF8);
     }
   Li_FFBC = 0;
   Gi_0001 = Li_FFF8 - TrendPeriod;
   if(Gi_0001 >= 0)
     {
      do
        {
         Id_0208[Li_FFBC] = iMAOnArray(Id_0694, 0, Ii_0624, 0, TrendMaMethod, Li_FFBC);
         Li_FFBC = Li_FFBC + 1;
         Gi_0003 = Li_FFF8 - TrendPeriod;
        }
      while(Li_FFBC <= Gi_0003);
     }
   Li_FFB8 = Li_FFF8 - TrendPeriod;
   if(Li_FFB8 >= 0)
     {
      do
        {
         Gi_0003 = Li_FFB8 + 1;
         Gi_0004 = Gi_0003;
         Ld_FFC4[Li_FFB8] = Ld_FFC4[Gi_0003];
         Gi_0007 = Gi_0004;
         if((Id_0208[Li_FFB8] > Id_0208[Gi_0004]))
           {
            Ld_FFC4[Li_FFB8] = 1;
           }
         Gi_000A = Li_FFB8 + 1;
         if((Id_0208[Li_FFB8] < Id_0208[Gi_000A]))
           {
            Ld_FFC4[Li_FFB8] = -1;
           }
         if((Ld_FFC4[Li_FFB8] > 0))
           {
            Id_01A0[Li_FFB8] = Id_0208[Li_FFB8];
            Gi_000F = Li_FFB8 + 1;
            if((Ld_FFC4[Gi_000F] < 0))
              {
               Gi_0011 = Gi_000F;
               Gi_0012 = Gi_000F;
               Id_01A0[Gi_000F] = Id_0208[Gi_000F];
              }
            Id_01D4[Li_FFB8] = 2147483647;
           }
         if((Ld_FFC4[Li_FFB8] < 0))
           {
            Id_01D4[Li_FFB8] = Id_0208[Li_FFB8];
            Gi_0017 = Li_FFB8 + 1;
            if((Ld_FFC4[Gi_0017] > 0))
              {
               Gi_0019 = Gi_0017;
               Gi_001A = Gi_0017;
               Id_01D4[Gi_0017] = Id_0208[Gi_0017];
              }
            Id_01A0[Li_FFB8] = 2147483647;
           }
         Li_FFB8 = Li_FFB8 - 1;
        }
      while(Li_FFB8 >= 0);
     }
   Li_FFFC = Fa_i_00;
   ArrayFree(Ld_FFC4);

   return Li_FFFC;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int func_1205(const int Fa_i_00,
              const int Fa_i_01,
              const long &Fa_l_02[],
              const double &Fa_d_03[],
              const double &Fa_d_04[],
              const double &Fa_d_05[],
              const double &Fa_d_06[])
  {
   int Li_FFFC;
   int Li_FFF8;
   int Li_FFF4;
   int Li_FFF0;

   if(Fa_i_01 == Fa_i_00)
     {
      Li_FFFC = Fa_i_00;
      return Li_FFFC;
     }
   if(Fa_i_01 == 0)
     {
      Li_FFF8 = 0;
      do
        {
         Gd_0000 = 0;
         Input_ArrayDouble_628.Add(Gd_0000);
         Li_FFF8 = Li_FFF8 + 1;
        }
      while(Li_FFF8 < 27);
     }
   if(Fa_i_01 == 0)
     {
      Gi_0005 = Fa_i_00 - StohLen;
      Gi_0005 = Gi_0005 - 1;
     }
   else
     {
      Gi_0006 = Fa_i_00 - Fa_i_01;
      Gi_0005 = Gi_0006;
     }
   Li_FFF4 = Gi_0005;
   Li_FFF0 = Gi_0005;

   if(Gi_0005 < 0)
      return Fa_i_00;
   do
     {
      Gi_0006 = 0;
      Gd_0007 = Input_ArrayDouble_628.At(Gi_0006);
      if((Gd_0007 == 0))
        {
         Input_ArrayDouble_628.Update(0, 1);
         Input_ArrayDouble_628.Update(1, 0);

         Gi_000D = StohLen - 1;
         if(Gi_000D >= 5)
           {
            Gd_000D = (StohLen - 1);
           }
         else
           {
            Gd_000D = 5;
           }
         Input_ArrayDouble_628.Update(2, Gd_000D);

         Gd_0011 = (Fa_d_04[Li_FFF0] + Fa_d_05[Li_FFF0]);
         Gd_0011 = (((Gd_0011 + Fa_d_06[Li_FFF0]) / 3) * 100);
         Input_ArrayDouble_628.Update(3, Gd_0011);

         Gd_0011 = ((double)3 / (StohLen + 2));

         Input_ArrayDouble_628.Update(4, Gd_0011);

         Gd_0017 = Input_ArrayDouble_628.At(4);
         Gd_0019 = (1 - Gd_0017);
         Input_ArrayDouble_628.Update(5, Gd_0019);
        }
      else
        {

         Gd_001C = Input_ArrayDouble_628.At(2);

         Gd_001F = Input_ArrayDouble_628.At(0);
         if((Gd_001C <= Gd_001F))
           {

            Gd_0022 = Input_ArrayDouble_628.At(2);

            Gd_0024 = (Gd_0022 + 1);
           }
         else
           {

            Gd_0026 = Input_ArrayDouble_628.At(0);
            Gd_0024 = (Gd_0026 + 1);
           }

         Input_ArrayDouble_628.Update(0, Gd_0024);

         Gd_002A = Input_ArrayDouble_628.At(3);

         Input_ArrayDouble_628.Update(6, Gd_002A);

         Gd_0030 = (Fa_d_04[Li_FFF0] + Fa_d_05[Li_FFF0]);
         Gd_0030 = (((Gd_0030 + Fa_d_06[Li_FFF0]) / 3) * 100);

         Input_ArrayDouble_628.Update(3, Gd_0030);

         Gd_0034 = Input_ArrayDouble_628.At(3);


         Gd_0037 = Input_ArrayDouble_628.At(6);

         Gd_0039 = (Gd_0034 - Gd_0037);

         Input_ArrayDouble_628.Update(7, Gd_0039);

         Gd_003C = Input_ArrayDouble_628.At(5);

         Gd_003F = Input_ArrayDouble_628.At(8);

         Gd_0041 = (Gd_003C * Gd_003F);
         Gd_0043 = Input_ArrayDouble_628.At(4);

         Gd_0046 = Input_ArrayDouble_628.At(7);

         Gd_0041 = ((Gd_0043 * Gd_0046) + Gd_0041);

         Input_ArrayDouble_628.Update(8, Gd_0041);

         Gd_004A = Input_ArrayDouble_628.At(4);

         Gd_004D = Input_ArrayDouble_628.At(8);
         Gd_004F = (Gd_004A * Gd_004D);

         Gd_0051 = Input_ArrayDouble_628.At(5);


         Gd_0054 = Input_ArrayDouble_628.At(9);
         Gd_004F = ((Gd_0051 * Gd_0054) + Gd_004F);

         Input_ArrayDouble_628.Update(9, Gd_004F);


         Gd_0058 = Input_ArrayDouble_628.At(8);
         Gd_005A = (Gd_0058 * 1.5);

         Gd_005C = Input_ArrayDouble_628.At(9);
         Gd_005E = (Gd_005C / 2);
         Gd_005E = (Gd_005A - Gd_005E);

         Input_ArrayDouble_628.Update(10, Gd_005E);

         Gd_0061 = Input_ArrayDouble_628.At(5);

         Gd_0064 = Input_ArrayDouble_628.At(11);

         Gd_0066 = (Gd_0061 * Gd_0064);

         Gd_0068 = Input_ArrayDouble_628.At(4);


         Gd_006B = Input_ArrayDouble_628.At(10);

         Gd_0066 = ((Gd_0068 * Gd_006B) + Gd_0066);

         Input_ArrayDouble_628.Update(11, Gd_0066);


         Gd_006F = Input_ArrayDouble_628.At(4);


         Gd_0072 = Input_ArrayDouble_628.At(11);

         Gd_0074 = (Gd_006F * Gd_0072);

         Gd_0076 = Input_ArrayDouble_628.At(5);

         Gi_0078 = 12;

         Gd_0079 = Input_ArrayDouble_628.At(12);

         Gd_0074 = ((Gd_0076 * Gd_0079) + Gd_0074);

         Input_ArrayDouble_628.Update(12, Gd_0074);

         Gd_007D = Input_ArrayDouble_628.At(11);

         Gd_007F = (Gd_007D * 1.5);

         Gd_0081 = Input_ArrayDouble_628.At(12);

         Gd_0083 = (Gd_0081 / 2);
         Gd_0083 = (Gd_007F - Gd_0083);

         Input_ArrayDouble_628.Update(13, Gd_0083);

         Gd_0086 = Input_ArrayDouble_628.At(5);

         Gd_0089 = Input_ArrayDouble_628.At(14);

         Gd_008B = (Gd_0086 * Gd_0089);

         Gd_008D = Input_ArrayDouble_628.At(4);


         Gd_0090 = Input_ArrayDouble_628.At(13);

         Gd_008B = ((Gd_008D * Gd_0090) + Gd_008B);

         Input_ArrayDouble_628.Update(14, Gd_008B);

         Gd_0094 = Input_ArrayDouble_628.At(4);

         Gd_0097 = Input_ArrayDouble_628.At(14);

         Gd_0099 = (Gd_0094 * Gd_0097);

         Gd_009B = Input_ArrayDouble_628.At(5);

         Gd_009E = Input_ArrayDouble_628.At(15);

         Gd_0099 = ((Gd_009B * Gd_009E) + Gd_0099);

         Input_ArrayDouble_628.Update(15, Gd_0099);

         Gd_00A2 = Input_ArrayDouble_628.At(14);

         Gd_00A4 = (Gd_00A2 * 1.5);

         Gd_00A6 = Input_ArrayDouble_628.At(15);


         Gd_00A8 = (Gd_00A6 / 2);
         Gd_00A8 = (Gd_00A4 - Gd_00A8);

         Input_ArrayDouble_628.Update(16, Gd_00A8);

         Gd_00AB = Input_ArrayDouble_628.At(5);

         Gd_00AE = Input_ArrayDouble_628.At(17);

         Gd_00B0 = (Gd_00AB * Gd_00AE);

         Gd_00B2 = Input_ArrayDouble_628.At(4);

         Gd_00B5 = Input_ArrayDouble_628.At(7);

         Gd_00B7 = fabs(Gd_00B5);
         Gd_00B7 = ((Gd_00B2 * Gd_00B7) + Gd_00B0);

         Input_ArrayDouble_628.Update(17, Gd_00B7);

         Gd_00BA = Input_ArrayDouble_628.At(4);

         Gd_00BD = Input_ArrayDouble_628.At(17);

         Gd_00BF = (Gd_00BA * Gd_00BD);

         Gd_00C1 = Input_ArrayDouble_628.At(5);

         Gd_00C4 = Input_ArrayDouble_628.At(18);


         Gd_00BF = ((Gd_00C1 * Gd_00C4) + Gd_00BF);

         Input_ArrayDouble_628.Update(18, Gd_00BF);

         Gd_00C8 = Input_ArrayDouble_628.At(17);

         Gd_00CA = (Gd_00C8 * 1.5);

         Gd_00CC = Input_ArrayDouble_628.At(18);

         Gd_00CE = (Gd_00CC / 2);
         Gd_00CE = (Gd_00CA - Gd_00CE);

         Input_ArrayDouble_628.Update(19, Gd_00CE);

         Gd_00D1 = Input_ArrayDouble_628.At(5);

         Gd_00D4 = Input_ArrayDouble_628.At(20);

         Gd_00D6 = (Gd_00D1 * Gd_00D4);

         Gd_00D8 = Input_ArrayDouble_628.At(4);

         Gd_00DB = Input_ArrayDouble_628.At(19);

         Gd_00D6 = ((Gd_00D8 * Gd_00DB) + Gd_00D6);

         Input_ArrayDouble_628.Update(20, Gd_00D6);

         Gd_00DF = Input_ArrayDouble_628.At(4);

         Gd_00E2 = Input_ArrayDouble_628.At(20);

         Gd_00E4 = (Gd_00DF * Gd_00E2);

         Gd_00E6 = Input_ArrayDouble_628.At(5);

         Gd_00E9 = Input_ArrayDouble_628.At(21);

         Gd_00E4 = ((Gd_00E6 * Gd_00E9) + Gd_00E4);

         Input_ArrayDouble_628.Update(21, Gd_00E4);


         Gd_00ED = Input_ArrayDouble_628.At(20);

         Gd_00EF = (Gd_00ED * 1.5);

         Gd_00F1 = Input_ArrayDouble_628.At(21);

         Gd_00F3 = (Gd_00F1 / 2);
         Gd_00F3 = (Gd_00EF - Gd_00F3);

         Input_ArrayDouble_628.Update(22, Gd_00F3);

         Gd_00F6 = Input_ArrayDouble_628.At(5);

         Gd_00F9 = Input_ArrayDouble_628.At(23);

         Gd_00FB = (Gd_00F6 * Gd_00F9);

         Gd_00FD = Input_ArrayDouble_628.At(4);

         Gd_0100 = Input_ArrayDouble_628.At(22);

         Gd_00FB = ((Gd_00FD * Gd_0100) + Gd_00FB);

         Input_ArrayDouble_628.Update(23, Gd_00FB);

         Gd_0104 = Input_ArrayDouble_628.At(4);

         Gd_0107 = Input_ArrayDouble_628.At(23);

         Gd_0109 = (Gd_0104 * Gd_0107);

         Gd_010B = Input_ArrayDouble_628.At(5);

         Gd_010E = Input_ArrayDouble_628.At(24);

         Gd_0109 = ((Gd_010B * Gd_010E) + Gd_0109);

         Input_ArrayDouble_628.Update(24, Gd_0109);

         Gd_0112 = Input_ArrayDouble_628.At(23);

         Gd_0114 = (Gd_0112 * 1.5);

         Gd_0116 = Input_ArrayDouble_628.At(24);

         Gd_0118 = (Gd_0116 / 2);
         Gd_0118 = (Gd_0114 - Gd_0118);

         Input_ArrayDouble_628.Update(25, Gd_0118);

         Gd_011B = Input_ArrayDouble_628.At(2);
         Gd_011E = Input_ArrayDouble_628.At(0);

         if((Gd_011B >= Gd_011E))
           {
            Gd_0121 = Input_ArrayDouble_628.At(3);
            Gd_0124 = Input_ArrayDouble_628.At(6);

            if((Gd_0121 != Gd_0124))
              {
               Input_ArrayDouble_628.Update(1, 1);

              }
           }
         Gd_0129 = Input_ArrayDouble_628.At(2);
         Gd_012C = Input_ArrayDouble_628.At(0);

         if((Gd_0129 == Gd_012C))
           {
            Gd_012F = Input_ArrayDouble_628.At(1);

            if((Gd_012F == 0))
              {
               Input_ArrayDouble_628.Update(0, 0);

              }
           }
        }
      Gd_0134 = Input_ArrayDouble_628.At(2);
      Gd_0137 = Input_ArrayDouble_628.At(0);
      Gd_013A = Input_ArrayDouble_628.At(25);
      if((Gd_0134 < Gd_0137) && (Gd_013A > 1E-10))
        {
         Gd_013D = Input_ArrayDouble_628.At(16);

         Gd_0140 = Input_ArrayDouble_628.At(25);

         Gd_0142 = (((Gd_013D / Gd_0140) + 1) * 50);
         Input_ArrayDouble_628.Update(26, Gd_0142);

         Gd_0145 = Input_ArrayDouble_628.At(26);

         if((Gd_0145 > 100))
           {

            Input_ArrayDouble_628.Update(26, 100);

           }

         Gd_014A = Input_ArrayDouble_628.At(26);

         if((Gd_014A < 0))
           {

            Input_ArrayDouble_628.Update(26, 0);

           }
        }
      else
        {

         Input_ArrayDouble_628.Update(26, 50);

        }

      Gd_0151 = Input_ArrayDouble_628.At(26);


      Id_016C[Li_FFF0] = Gd_0151;

      Gd_0155 = Input_ArrayDouble_628.At(26);

      Id_0104[Li_FFF0] = Gd_0155;

      Gd_0159 = Input_ArrayDouble_628.At(26);

      Id_0138[Li_FFF0] = Gd_0159;
      Gi_015D = Li_FFF0 + 1;
      if((Id_016C[Li_FFF0] > (Id_016C[Gi_015D] - StohFilter)))
        {
         Id_0138[Li_FFF0] = 2147483647;
        }
      else
        {
         Gi_0160 = Li_FFF0 + 1;
         if((Id_016C[Li_FFF0] < (Id_016C[Gi_0160] + StohFilter)))
           {
            Id_0104[Li_FFF0] = 2147483647;
           }
         else
           {
            Gi_0163 = Li_FFF0 + 1;
            if((Id_016C[Li_FFF0] == (Id_016C[Gi_0163] + StohFilter)))
              {
               Id_0104[Li_FFF0] = 2147483647;
               Id_0138[Li_FFF0] = 2147483647;
              }
           }
        }

      Li_FFF0 = Li_FFF0 - 1;
     }
   while(Li_FFF0 >= 0);

   Li_FFFC = Fa_i_00;

   return Li_FFFC;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void func_1206(int Fa_i_00, int Fa_i_01, const long &Fa_l_02[], const double &Fa_d_03[], const double &Fa_d_04[], const double &Fa_d_05[], const double &Fa_d_06[])
  {
   double Ld_FFF8;
   double Ld_FFF0;
   double Ld_FFE8;
   double Ld_FFE0;
   int Li_FFDC;
   int Li_FFD8;
   int Li_FFCC;
   int Li_FFC8;
   int Li_FFD0;
   int Li_FFD4;

   if(Fa_i_01 == Fa_i_00)
      return;
   if(Fa_i_01 == 0)
     {
      Input_SLast_298.m_0 = -1;
      Input_SLast_298.m_8 = -1;
      Input_SLast_2A8.m_0 = -1;
      Input_SLast_2A8.m_8 = -1;
     }
   Ld_FFF8 = 0;
   Ld_FFF0 = 0;
   Ld_FFE8 = 0;
   Ld_FFE0 = 0;
   if(Fa_i_01 == 0)
     {
      Gi_0000 = Fa_i_00 - SigDepth;
     }
   else
     {
      Gi_0001 = iBarShift(NULL, 0, Input_SLast_2A8.m_0, false);
      Gi_0002 = iBarShift(NULL, 0, Input_SLast_298.m_0, false);
      if(Gi_0002 <= Gi_0001)
        {
        }
      else
        {
         Gi_0001 = Gi_0002;
        }
      Gi_0000 = Gi_0001;
     }
   Li_FFDC = Gi_0000;
   Li_FFD8 = Gi_0000;
   if(Gi_0000 >= 0)
     {
      do
        {
         Gi_0001 = iLowest(NULL, 0, 1, SigDepth, Li_FFD8);
         Ld_FFF8 = Fa_d_05[Gi_0001];
         if((Ld_FFF8 == Input_SLast_298.m_8))
           {
            Ld_FFF8 = 0;
           }
         else
           {
            Input_SLast_298.m_8 = Ld_FFF8;
            Gd_0004 = (Fa_d_05[Li_FFD8] - Ld_FFF8);
            if((Gd_0004 > (SigDeviation * _Point)))
              {
               Ld_FFF8 = 0;
              }
            else
              {
               Li_FFD4 = 1;
               if(SigBackstep >= 1)
                 {
                  do
                    {
                     Gi_0004 = Li_FFD8 + Li_FFD4;
                     Ld_FFF0 = Id_009C[Gi_0004];
                     if((Ld_FFF0 != 0) && (Ld_FFF0 > Ld_FFF8))
                       {
                        Gi_0006 = Gi_0004;
                        Id_009C[Gi_0004] = 0;
                       }
                     Li_FFD4 = Li_FFD4 + 1;
                    }
                  while(Li_FFD4 <= SigBackstep);
                 }
              }
           }
         Id_009C[Li_FFD8] = Ld_FFF8;
         Gi_0008 = iHighest(NULL, 0, 2, SigDepth, Li_FFD8);
         Ld_FFF8 = Fa_d_04[Gi_0008];
         if((Ld_FFF8 == Input_SLast_2A8.m_8))
           {
            Ld_FFF8 = 0;
           }
         else
           {
            Input_SLast_2A8.m_8 = Ld_FFF8;
            Gd_000A = (Ld_FFF8 - Fa_d_04[Li_FFD8]);
            if((Gd_000A > (SigDeviation * _Point)))
              {
               Ld_FFF8 = 0;
              }
            else
              {
               Li_FFD0 = 1;
               if(SigBackstep >= 1)
                 {
                  do
                    {
                     Gi_000A = Li_FFD8 + Li_FFD0;
                     Ld_FFF0 = Id_00D0[Gi_000A];
                     if((Ld_FFF0 != 0) && (Ld_FFF0 < Ld_FFF8))
                       {
                        Gi_000C = Gi_000A;
                        Id_00D0[Gi_000A] = 0;
                       }
                     Li_FFD0 = Li_FFD0 + 1;
                    }
                  while(Li_FFD0 <= SigBackstep);
                 }
              }
           }
         Id_00D0[Li_FFD8] = Ld_FFF8;
         Li_FFD8 = Li_FFD8 - 1;
        }
      while(Li_FFD8 >= 0);
     }
   Input_SLast_298.m_8 = -1;
   Input_SLast_2A8.m_8 = -1;
   Li_FFCC = Li_FFDC;
   if(Li_FFDC >= 0)
     {
      do
        {
         Ld_FFE8 = Id_009C[Li_FFCC];
         Ld_FFE0 = Id_00D0[Li_FFCC];
         if((Ld_FFE8 != 0) || Ld_FFE0 != 0)
           {

            if((Ld_FFE0 != 0))
              {
               if((Input_SLast_2A8.m_8 > 0))
                 {
                  if((Input_SLast_2A8.m_8 < Ld_FFE0))
                    {
                     Gi_0010 = iBarShift(NULL, 0, Input_SLast_2A8.m_0, false);
                     Id_00D0[Gi_0010] = 0;
                    }
                  else
                    {
                     Id_00D0[Li_FFCC] = 0;
                    }
                 }
               if((Input_SLast_2A8.m_8 < Ld_FFE0) || (Input_SLast_2A8.m_8 < 0))
                 {

                  Input_SLast_2A8.m_8 = Ld_FFE0;
                  Input_SLast_2A8.m_0 = (int)Fa_l_02[Li_FFCC];
                 }
               Input_SLast_298.m_8 = -1;
              }
            if((Ld_FFE8 != 0))
              {
               if((Input_SLast_298.m_8 > 0))
                 {
                  if((Input_SLast_298.m_8 > Ld_FFE8))
                    {
                     Gi_0013 = iBarShift(NULL, 0, Input_SLast_298.m_0, false);
                     Id_009C[Gi_0013] = 0;
                    }
                  else
                    {
                     Id_009C[Li_FFCC] = 0;
                    }
                 }
               if((Ld_FFE8 < Input_SLast_298.m_8) || (Input_SLast_298.m_8 < 0))
                 {

                  Input_SLast_298.m_8 = Ld_FFE8;
                  Input_SLast_298.m_0 =(int) Fa_l_02[Li_FFCC];
                 }
               Input_SLast_2A8.m_8 = -1;
              }
           }
         Li_FFCC = Li_FFCC - 1;
        }
      while(Li_FFCC >= 0);
     }
   Li_FFC8 = Fa_i_00 - 1;
   if(Li_FFC8 < 0)
      return;
   do
     {
      Gi_0016 = Fa_i_00 - SigDepth;
      if(Li_FFC8 >= Gi_0016)
        {
         Id_009C[Li_FFC8] = 0;
        }
      else
        {
         Ld_FFF0 = Id_00D0[Li_FFC8];
         if((Ld_FFF0 != 0))
           {
            Id_00D0[Li_FFC8] = Ld_FFF0;
           }
        }
      Li_FFC8 = Li_FFC8 - 1;
     }
   while(Li_FFC8 >= 0);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string func_1207(int Fa_i_00)
  {
   string tmp_str0000;
   tmp_str0000 = "Unknown period";


   returned_i = Fa_i_00;
   if(returned_i < 1)
      return "Unknown period";
   if(returned_i > 43200)
      return "Unknown period";
   if(returned_i == 1)
      tmp_str0000 = "M1";
   if(returned_i == 5)
      tmp_str0000 = "M5";
   if(returned_i == 15)
      tmp_str0000 = "M15";
   if(returned_i == 30)
      tmp_str0000 = "M30";
   if(returned_i == 60)
      tmp_str0000 = "H1";
   if(returned_i == 240)
      tmp_str0000 = "H4";
   if(returned_i == 1440)
      tmp_str0000 = "D1";
   if(returned_i == 10080)
      tmp_str0000 = "W1";
   if(returned_i == 43200)
      tmp_str0000 = "MN1";



   return tmp_str0000;
  }


//+------------------------------------------------------------------+
