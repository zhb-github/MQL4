//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2022, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, 明泽资管";
#property link "明泽资管15588909999";
#property version "";
#property strict
#property description "明泽资管智能系统，由量化作者“15588909999”资管团队制作而成\n注意：本地时间周六0点起，不再开首单\n版本号：220211，修改时间：2022年02月19日";


extern int rsi参数=14;

extern int rsi上限大于多少不开buy=71;

extern int rsi下限小于多少不开buy=29;

extern ENUM_TIMEFRAMES rsi计算图表周期=30;


//+------------------------------------------------------------------+


extern int Magic = 8888; // 订单识别码
extern int MaxSpread = 30; // 允许最大点差
extern int slippage = 3; // 允许最大滑点
int Profit0 = 35;
extern int Step = 10; // 间隔加码点数
extern int Prosadka = 700; // 加码标准点数
extern int Buycount = 15; // 买单数量
extern int Sellcount = 15; // 卖单数量
extern double Risk; // 风险系数
extern double manuallots = 0.5; // 手工手数
extern bool timecontrol = true; // 跳空规避
extern int timestart; // 开始时间
extern int timeend = 24; // 结束时间

bool Gb_0000;
int returned_i;
bool returned_b;
bool Gb_0001;
double Gd_0003;
double Ind_000;
double Ind_002;
int Ii_0060;
long Gl_0002;
long returned_l;
int Gi_0003;
string Is_0038;
double Id_0108;
double Id_00B8;
double Id_00B0;
double Id_00C0;
double Id_00C8;
int Ii_00D0;
int Ii_00D4;
int Ii_0110;
int Ii_0114;
int Ii_0118;
int Ii_011C;
double Id_0120;
double Id_0128;
double Id_0130;
double Id_0138;
double Id_0140;
double Id_0148;
double Id_0150;
double Id_0158;
double Id_00F8;
double Id_0100;
double Id_0178;
double Id_01A0;
double Id_01A8;
double Id_0168;
double Id_01B8;
double Id_01B0;
double Id_01C0;
double Id_01F8;
double Id_0200;
bool Ib_0095;
long Gl_0000;
string Is_0088;
int Gi_0000;
bool Ib_0096;
double Gd_0000;
double Gd_0001;
double Gd_0002;
int Gi_0004;
bool Gb_0003;
double Gd_0005;
double Gd_0006;
int Gi_0007;
int Gi_0008;
double Gd_0007;
bool Gb_0007;
double Ind_004;
int Gi_0009;
int Gi_000A;
double Gd_0009;
double Gd_000B;
int Gi_000C;
double Gd_000C;
double Gd_000D;
int Gi_000E;
int Ii_009C;
double Gd_000E;
bool Gb_000E;
int Gi_000F;
int Gi_0010;
double Gd_000F;
double Gd_0011;
int Gi_0012;
double Gd_0012;
double Gd_0013;
int Gi_0014;
bool Gb_0014;
long Gl_0014;
long Gl_0015;
long Il_01C8;
bool Ib_0010;
double Gd_0015;
int Ii_0044;
long Il_0050;
int Ii_0064;
bool Ib_0098;
bool Ib_0094;
int Gi_0015;
bool Gb_0016;
double Gd_0016;
double Gd_0017;
double Id_0008;
bool Gb_0017;
double Gd_0018;
bool Gb_0018;
double Id_0078;
long Gl_0018;
int Gi_0019;
int Ii_004C;
long Gl_0019;
long Il_01E0;
long Gl_0021;
int Gi_0022;
long Gl_0022;
bool Ib_0097;
double Gd_0022;
bool Gb_0023;
double Gd_0023;
double Gd_0024;
bool Gb_0024;
double Id_0080;
long Gl_0024;
int Gi_0025;
long Gl_0025;
long Il_01D8;
long Gl_002D;
int Gi_002E;
long Gl_002E;
int Ii_0048;
long Il_0058;
double Id_0068;
bool Gb_002E;
int Gi_002F;
long Gl_002F;
long Il_01F0;
long Gl_0037;
int Gi_0038;
long Gl_0038;
double Id_0070;
bool Gb_0038;
int Gi_0039;
long Gl_0039;
long Il_01E8;
long Gl_0041;
int Gi_0042;
long Gl_0042;
double Gd_0039;
int Gi_003A;
int Gi_003B;
double Gd_003A;
bool Gb_003C;
long Gl_003C;
double Gd_003C;
double Gd_003D;
int Gi_003E;
double Gd_003E;
bool Gb_003F;
long Gl_003F;
double Gd_003F;
double Gd_0040;
int Gi_0041;
double Gd_002F;
int Gi_0030;
int Gi_0031;
double Gd_0030;
bool Gb_0032;
long Gl_0032;
double Gd_0032;
double Gd_0033;
int Gi_0034;
double Gd_0034;
bool Gb_0035;
long Gl_0035;
double Gd_0035;
double Gd_0036;
int Gi_0037;
double Gd_0025;
int Gi_0026;
int Gi_0027;
double Gd_0026;
bool Gb_0028;
long Gl_0028;
double Gd_0028;
double Gd_0029;
int Gi_002A;
double Gd_002A;
bool Gb_002B;
long Gl_002B;
double Gd_002B;
double Gd_002C;
int Gi_002D;
double Gd_0019;
int Gi_001A;
int Gi_001B;
double Gd_001A;
bool Gb_001C;
long Gl_001C;
double Gd_001C;
double Gd_001D;
int Gi_001E;
double Gd_001E;
bool Gb_001F;
long Gl_001F;
double Gd_001F;
double Gd_0020;
int Gi_0021;
int Gi_0001;
int Gi_0002;
long Gl_0003;
int Gi_0005;
long Gl_0006;
bool Gb_0006;
long Gl_0009;
int Gi_000B;
double Gd_000A;
int Gi_000D;
bool Gb_000F;
int Gi_0011;
long Gl_0012;
int Gi_0013;
int Gi_0016;
int Gi_0018;
long Gl_001B;
int Gi_001C;
int Gi_001D;
int Gi_001F;
bool Gb_0021;
int Gi_0023;
long Gl_0027;
bool Gb_0027;
int Gi_0028;
int Gi_0029;
long Gl_002A;
bool Gb_002A;
int Gi_002B;
int Gi_002C;
double Id_0000;
int Ii_0014;
int Ii_0018;
bool Ib_001C;
int Ii_0020;
double Id_0028;
double Id_0030;
bool Ib_0099;
double Id_00A0;
double Id_00A8;
double Id_00D8;
double Id_00E0;
double Id_00E8;
double Id_00F0;
int Ii_0160;
int Ii_0164;
double Id_0170;
long Il_0180;
long Il_0188;
double Id_0190;
double Id_0198;
long Il_01D0;
bool Ib_0208;
double Gd_0004;
int Gi_0006;
double Gd_0008;
bool Gb_0005;
bool Gb_000A;
long Gl_0001;
bool Gb_0004;
bool Gb_0008;
bool Gb_0009;
long Gl_0004;
long Gl_0005;
long Gl_0007;
long Gl_0008;
long Gl_000C;
long Gl_000D;
long Gl_000F;
long Gl_0010;
long Gl_0011;
bool Gb_0013;
long Gl_0016;
long Gl_0017;
long Gl_001A;
bool Gb_001D;
long Gl_001E;
int Gi_0020;
long Gl_0020;
bool Gb_0022;
long Gl_0023;
int Gi_0024;
long Gl_0026;
long Gl_0029;
bool Gb_002C;
long Gl_0030;
bool Gb_0031;
long Gl_0033;
int Gi_0033;
long Gl_0034;
bool Gb_0036;
long Gl_003A;
bool Gb_003B;
long Gl_003D;
int Gi_003D;
long Gl_003E;
bool Gb_0040;
long Gl_0043;
int Gi_0043;
long Gl_0044;
bool Gb_0045;
long Gl_0046;
long Gl_0047;
int Gi_0047;
long Gl_0048;
int Gi_0048;
long Gl_0049;
bool Gb_004A;
long Gl_004B;
long Gl_004C;
int Gi_004C;
int Gi_004D;
long Gl_004D;
long Gl_004E;
bool Gb_004F;
long Gl_0050;
long Gl_0051;
int Gi_0051;
int Gi_0052;
long Gl_0052;
long Gl_0053;
bool Gb_0054;
long Gl_0055;
long Gl_0056;
int Gi_0056;
int Gi_0057;
long Gl_0057;
long Gl_0058;
bool Gb_0059;
long Gl_005A;
long Gl_005B;
int Gi_005B;
int Gi_005C;
long Gl_005C;
long Gl_005D;
bool Gb_005E;
long Gl_005F;
long Gl_0060;
int Gi_0060;
double Gd_0061;
int Gi_0061;
long Gl_0061;
long Gl_0062;
bool Gb_0063;
long Gl_0064;
long Gl_0065;
int Gi_0065;
int Gi_0066;
long Gl_0066;
long Gl_0067;
bool Gb_0068;
long Gl_0069;
long Gl_006A;
int Gi_006A;
double returned_double;
bool order_check;
void init()
  {

   Id_0000 = 1.8;
   Id_0008 = 0.01;
   Ib_0010 = true;
   Ii_0014 = 255;
   Ii_0018 = 10;
   Ib_001C = false;
   Ii_0020 = 15;
   Id_0028 = 1;
   Id_0030 = 1;
   Is_0038 = "【明泽资本】QQ";
   Ii_0044 = 1;
   Ii_0048 = 1;
   Ii_004C = 1;
   Il_0050 = 0;
   Il_0058 = 0;
   Ii_0060 = 0;
   Ii_0064 = 0;
   Id_0068 = 0;
   Id_0070 = 0;
   Id_0078 = 0;
   Id_0080 = 0;
   Ib_0094 = true;
   Ib_0095 = false;
   Ib_0096 = false;
   Ib_0097 = true;
   Ib_0098 = true;
   Ib_0099 = true;
   Ii_009C = 0;
   Id_00A0 = 0;
   Id_00A8 = 0;
   Id_00B0 = 0;
   Id_00B8 = 0;
   Id_00C0 = 0;
   Id_00C8 = 0;
   Ii_00D0 = 0;
   Ii_00D4 = 0;
   Id_00D8 = 0;
   Id_00E0 = 0;
   Id_00E8 = 0;
   Id_00F0 = 0;
   Id_00F8 = 0;
   Id_0100 = 0;
   Id_0108 = 0;
   Ii_0110 = 0;
   Ii_0114 = 0;
   Ii_0118 = 0;
   Ii_011C = 0;
   Id_0120 = 0;
   Id_0128 = 0;
   Id_0130 = 0;
   Id_0138 = 0;
   Id_0140 = 0;
   Id_0148 = 0;
   Id_0150 = 0;
   Id_0158 = 0;
   Ii_0160 = 0;
   Ii_0164 = 0;
   Id_0168 = 0;
   Id_0170 = 0;
   Id_0178 = 0;
   Il_0180 = 0;
   Il_0188 = 0;
   Id_0190 = 0;
   Id_0198 = 0;
   Id_01A0 = 0;
   Id_01A8 = 0;
   Id_01B0 = 0;
   Id_01B8 = 0;
   Id_01C0 = 0;
   Il_01C8 = 0;
   Il_01D0 = 0;
   Il_01D8 = 0;
   Il_01E0 = 0;
   Il_01E8 = 0;
   Il_01F0 = 0;
   Id_01F8 = 0;
   Id_0200 = 0;
   Ib_0208 = false;

   EventSetTimer(60);
   Gd_0003 = log(MarketInfo(_Symbol, MODE_LOTSTEP));
   Gd_0003 = fabs((Gd_0003 / 2.30258509299405));
   Gd_0003 = ceil(Gd_0003);
   Ii_0060 = (int)Gd_0003;

   Alert("欢迎使用明泽智能交易系统！");
  }

//+------------------------------------------------------------------+
int CountT(int t)
  {
   bool b=0;
   int li_4 = 0;
   int li_8 = OrdersTotal();
   for(int li_12=0; li_12<li_8; li_12++)
     {
      b=OrderSelect(li_12,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==Magic && OrderType()==t)
         li_4++;
     }
   return (li_4);
  }
extern bool 启用新增平仓方式=1;

extern int 首单均价盈利点数=500;
extern int 递减点数=50;
extern int 最少盈利点数=100;
extern int 第几单以后启用递减点数=5;


int 点数b,点数s;
void set()
  {

   if(启用新增平仓方式)
     {
      点数b=首单均价盈利点数;
      if(CountT(0)>第几单以后启用递减点数)
        {
         点数b=首单均价盈利点数-(CountT(0)-第几单以后启用递减点数+0)*递减点数;
         if(点数b<最少盈利点数)
            点数b=最少盈利点数;

        }


      点数s=首单均价盈利点数;
      if(CountT(1)>第几单以后启用递减点数)
        {
         点数s=首单均价盈利点数-(CountT(1)-第几单以后启用递减点数+0)*递减点数;
         if(点数s<最少盈利点数)
            点数s=最少盈利点数;

        }




     }
   else
     {
      点数b=首单均价盈利点数;


      点数s=首单均价盈利点数;
     }

  }

//|                                                                  |
//+------------------------------------------------------------------+
int sg(int t)
  {

   double rsi=iRSI(Symbol(),rsi计算图表周期,rsi参数,0,1);

   if(t==0)
     {

      if(rsi>rsi上限大于多少不开buy)
         return 0;
      return 1;

     }

   if(t==1)
     {

      if(rsi<rsi下限小于多少不开buy)
         return 0;
      return -1;

     }

   return 0;



  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {




   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   string tmp_str0004;
   string tmp_str0005;
   string tmp_str0006;
   string tmp_str0007;
   string tmp_str0008;
   string tmp_str0009;
   string tmp_str000A;
   string tmp_str000B;
   string tmp_str000C;
   string tmp_str000D;
   string tmp_str000E;
   string tmp_str000F;
   string tmp_str0010;
   string tmp_str0011;
   string tmp_str0012;
   string tmp_str0013;
   string tmp_str0014;
   string tmp_str0015;
   string tmp_str0016;
   string tmp_str0017;
   string tmp_str0018;
   string tmp_str0019;
   string tmp_str001A;
   string tmp_str001B;
   string tmp_str001C;

   Id_0108 = 0;
   Id_00B8 = 0;
   Id_00B0 = 0;
   Id_00C0 = 0;
   Id_00C8 = 0;
   Ii_00D0 = 0;
   Ii_00D4 = 0;
   Ii_0110 = 0;
   Ii_0114 = 0;
   Ii_0118 = 0;
   Ii_011C = 0;
   Id_0120 = 0;
   Id_0128 = 0;
   Id_0130 = 0;
   Id_0138 = 0;
   Id_0140 = 0;
   Id_0148 = 0;
   Id_0150 = 0;
   Id_0158 = 0;
   Id_00F8 = 0;
   Id_0100 = 0;
   Id_0178 = 0;
   Id_01A0 = 0;
   Id_01A8 = 0;
   Id_01A8 = 0;
   Id_0168 = 0;
   Id_01B8 = 0;
   Id_01B0 = 0;
   Id_01C0 = 0;
   Id_01F8 = 0;
   Id_0200 = 0;


   if(IsTesting())
     {
      OnTester();
     }
   else
     {
      OnTimer();
     }
   if(Ib_0095)
     {
      Print("正在手工开多单，请耐心等待");
      tmp_str0000 = Is_0038 + IntegerToString(Magic, 0, 32);
      tmp_str0000 = tmp_str0000 + "buy_手工";
      Is_0088 = tmp_str0000;
      if(OrderSend(_Symbol, 0, manuallots, Ask, slippage, 0, 0, tmp_str0000, Magic, 0, 16711680) < 0)
        {
         Print("手动加仓失败，错误码->", GetLastError());
        }
      Ib_0095 = false;
     }
   if(Ib_0096)
     {
      Print("正在手工开空单，请耐心等待");
      tmp_str0001 = Is_0038 + IntegerToString(Magic, 0, 32);
      tmp_str0001 = tmp_str0001 + "sell_手工";
      Is_0088 = tmp_str0001;
      if(OrderSend(_Symbol, 1, manuallots, Bid, slippage, 0, 0, tmp_str0001, Magic, 0, 255) < 0)
        {
         Print("手动加仓失败，错误码->", GetLastError());
        }
      Ib_0096 = false;
     }
   tmp_str0002 = "sell";
   Gd_0000 = 0;
   Gd_0001 = 0;
   Gd_0002 = 0;
   Gi_0003 = OrdersTotal() - 1;
   Gi_0004 = Gi_0003;
   if(Gi_0003 >= 0)
     {
      do
        {
         if(OrderSelect(Gi_0004, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
           {
            if(tmp_str0002 == "buy" && OrderType() == OP_BUY)
              {
               Gd_0003 = OrderOpenPrice();
               Gd_0000 = ((Gd_0003 * OrderLots()) + Gd_0000);
               Gd_0001 = (Gd_0001 + OrderLots());
              }
            if(tmp_str0002 == "sell" && OrderType() == OP_SELL)
              {
               Gd_0003 = OrderOpenPrice();
               Gd_0000 = ((Gd_0003 * OrderLots()) + Gd_0000);
               Gd_0001 = (Gd_0001 + OrderLots());
              }
           }
         Gi_0004 = Gi_0004 - 1;
        }
      while(Gi_0004 >= 0);
     }
   if((Gd_0001 != 0))
     {
      Gd_0002 = NormalizeDouble((Gd_0000 / Gd_0001), _Digits);
     }
   Id_01F8 = Gd_0002;
   tmp_str0003 = "buy";
   Gd_0003 = 0;
   Gd_0005 = 0;
   Gd_0006 = 0;
   Gi_0007 = OrdersTotal() - 1;
   Gi_0008 = Gi_0007;
   if(Gi_0007 >= 0)
     {
      do
        {
         if(OrderSelect(Gi_0008, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
           {
            if(tmp_str0003 == "buy" && OrderType() == OP_BUY)
              {
               Gd_0007 = OrderOpenPrice();
               Gd_0003 = ((Gd_0007 * OrderLots()) + Gd_0003);
               Gd_0005 = (Gd_0005 + OrderLots());
              }
            if(tmp_str0003 == "sell" && OrderType() == OP_SELL)
              {
               Gd_0007 = OrderOpenPrice();
               Gd_0003 = ((Gd_0007 * OrderLots()) + Gd_0003);
               Gd_0005 = (Gd_0005 + OrderLots());
              }
           }
         Gi_0008 = Gi_0008 - 1;
        }
      while(Gi_0008 >= 0);
     }
   if((Gd_0005 != 0))
     {
      Gd_0006 = NormalizeDouble((Gd_0003 / Gd_0005), _Digits);
     }
   Id_0200 = Gd_0006;
   if((Bid > ((点数b * _Point) + Gd_0006)))
     {
      Gi_0007 = 1;
      Gi_0009 = OrdersTotal() - 1;
      Gi_000A = Gi_0009;
      if(Gi_0009 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_000A, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_0007 == 1 || Gi_0007 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_0007 == 2 || Gi_0007 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_000E = Gi_000A - 1;
            Gi_000A = Gi_000E;
           }
         while(Gi_000E >= 0);
        }
     }
   Gd_000E = (点数s * _Point);
   if((Ask < (Id_01F8 - Gd_000E)))
     {
      Gi_000E = 2;
      Gi_000F = OrdersTotal() - 1;
      Gi_0010 = Gi_000F;
      if(Gi_000F >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0010, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_000E == 1 || Gi_000E == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_000E == 2 || Gi_000E == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_0014 = Gi_0010 - 1;
            Gi_0010 = Gi_0014;
           }
         while(Gi_0014 >= 0);
        }
     }
   func_1018();
   func_1019();
   if((MarketInfo(_Symbol, MODE_SPREAD) > MaxSpread))
     {
      Gl_0014 = TimeCurrent();
      Gl_0015 = Il_01C8 + 1800;
      if(Gl_0014 < Gl_0015)
         return;
      Print("警告：当前点差超过允许最大点差，开仓被禁止！");
      Il_01C8 = TimeCurrent();
      return ;
     }
   if(timecontrol != false)
     {
      if(StringFind(_Symbol, "BTC", 0) < 0 && (TimeDayOfWeek(TimeLocal()) > 5 || (TimeDayOfWeek(TimeLocal()) == 1 && TimeHour(TimeLocal()) < 8)))
        {

         Ib_0010 = false;
        }
      else
        {
         Ib_0010 = true;
        }
     }
   else
     {
      Ib_0010 = true;
     }
   if(Ii_0060 == 0)
     {
      Gd_0015 = log(MarketInfo(_Symbol, MODE_LOTSTEP));
      Gd_0015 = fabs((Gd_0015 / 2.30258509299405));
      Gd_0015 = ceil(Gd_0015);
      Ii_0060 = (int)Gd_0015;
     }
   if(Il_0050 != iTime(NULL, Ii_0044, 0))
     {
      Ii_0064 = 0;
      if(Ii_00D0 == 0 && Ib_0098 && Ib_0094 && Ib_0010 && TimeHour(TimeLocal()) >= timestart && TimeHour(TimeLocal()) <= timeend)
        {
         tmp_str0004 = Is_0038 + IntegerToString(Magic, 0, 32);
         tmp_str0004 = tmp_str0004 + " _Buy ";
         Gi_0015 = Ii_00D0 + 1;
         tmp_str0004 = tmp_str0004 + IntegerToString(Gi_0015, 0, 32);
         Is_0088 = tmp_str0004;
         tmp_str0004 = "buy";
         Gd_0015 = 0;
         if((Risk != 0))
           {
            Gd_0016 = (AccountBalance() / 30000);
            Gd_0017 = fabs(Risk);
            Gd_0015 = NormalizeDouble((Id_0008 * NormalizeDouble((Gd_0016 * Gd_0017), 2)), Ii_0060);
           }
         else
           {
            Gd_0015 = Id_0008;
           }
         if(tmp_str0004 == "sell")
           {
            if((Risk != 0))
              {
               Gd_0017 = (AccountBalance() / 30000);
               Gd_0018 = fabs(Risk);
               Gd_0015 = NormalizeDouble((Id_0008 * NormalizeDouble((Gd_0017 * Gd_0018), 2)), Ii_0060);
              }
            else
              {
               Gd_0015 = Id_0008;
              }
           }
         if((Gd_0015 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Gd_0015 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Gd_0015 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Gd_0015 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         Id_0078 = Gd_0015;
         if((Gd_0015 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Id_0078 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Id_0078 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Id_0078 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         if(Ii_0064 < 1)
           {
            Gl_0018 = TimeCurrent();
            Gi_0019 = Ii_004C * 60;
            Gl_0019 = Gi_0019;
            Gl_0019 = Il_01E0 + Gl_0019;
            if(Gl_0018 > Gl_0019)
               if(sg(0)==1)
                 {
                  do
                    {
                     if(IsTesting() != true)
                       {
                        tmp_str0005 = "品种:" + _Symbol;
                        tmp_str0005 = tmp_str0005 + " ,手数:";
                        tmp_str0005 = tmp_str0005 + DoubleToString(Id_0078, 2);
                        tmp_str0005 = tmp_str0005 + " ,开仓价格:";
                        tmp_str0005 = tmp_str0005 + DoubleToString(Ask, 4);
                        tmp_str0005 = tmp_str0005 + " ,注释:";
                        tmp_str0005 = tmp_str0005 + Is_0088;
                        tmp_str0005 = tmp_str0005 + " ,订单识别码:";
                        tmp_str0005 = tmp_str0005 + IntegerToString(Magic, 0, 32);
                        Print(tmp_str0005);
                       }
                     Ii_0064 = OrderSend(_Symbol, 0, Id_0078, Ask, slippage, 0, 0, Is_0088, Magic, 0, 16711680);
                     if(Ii_0064 < 1)
                       {
                        if(IsTesting() != true)
                          {
                           tmp_str0006 = " ,暂停时间:" + IntegerToString(Ii_004C, 0, 32);
                           tmp_str0006 = tmp_str0006 + " 分钟";
                           Print("错误码:", GetLastError(), tmp_str0006);
                          }
                        Il_01E0 = TimeCurrent();
                       }
                     else
                       {
                        tmp_str0007 = "buy";
                        Gd_0019 = 0;
                        Gi_001A = OrdersTotal() - 1;
                        Gi_001B = Gi_001A;
                        if(Gi_001A >= 0)
                          {
                           do
                             {
                              if(OrderSelect(Gi_001B, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
                                {
                                 if(tmp_str0007 == "buy" && OrderType() == OP_BUY)
                                   {
                                    Gd_001A = ((点数b * _Point) + Id_0200);
                                    if((OrderTakeProfit() != Gd_001A))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str0008 = "买单均价:" + DoubleToString(Id_0200, 4);
                                          tmp_str0008 = tmp_str0008 + " ,利润点位:";
                                          tmp_str0008 = tmp_str0008 + IntegerToString(点数b, 0, 32);
                                          tmp_str0008 = tmp_str0008 + " ,利润价格:";
                                          tmp_str0008 = tmp_str0008 + DoubleToString(Gd_001A, 4);
                                          Print(tmp_str0008);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_001A, 0, 65535);
                                      }
                                   }
                                 if(tmp_str0007 == "sell" && OrderType() == OP_SELL)
                                   {
                                    Gd_001E = (点数s * _Point);
                                    Gd_001E = (Id_01F8 - Gd_001E);
                                    if((OrderTakeProfit() != Gd_001E))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str0009 = "卖单均价:" + DoubleToString(Id_01F8, 4);
                                          tmp_str0009 = tmp_str0009 + " ,利润点位:";
                                          tmp_str0009 = tmp_str0009 + IntegerToString(点数s, 0, 32);
                                          tmp_str0009 = tmp_str0009 + " ,利润价格:";
                                          tmp_str0009 = tmp_str0009 + DoubleToString(Gd_001E, 4);
                                          Print(tmp_str0009);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_001E, 0, 65535);
                                      }
                                   }
                                }
                              Gi_001B = Gi_001B - 1;
                             }
                           while(Gi_001B >= 0);
                          }
                       }
                     RefreshRates();
                     if(Ii_0064 >= 1)
                        break;
                     Gl_0021 = TimeCurrent();
                     Gi_0022 = Ii_004C * 60;
                     Gl_0022 = Gi_0022;
                     Gl_0022 = Il_01E0 + Gl_0022;
                    }
                  while(Gl_0021 > Gl_0022);
                 }
           }
        }
      if(Ii_00D4 == 0 && Ib_0097 && Ib_0094 && Ib_0010 && TimeHour(TimeLocal()) >= timestart && TimeHour(TimeLocal()) <= timeend)
        {
         tmp_str000A = Is_0038 + IntegerToString(Magic, 0, 32);
         tmp_str000A = tmp_str000A + " _Sell ";
         Gi_0022 = Ii_00D4 + 1;
         tmp_str000A = tmp_str000A + IntegerToString(Gi_0022, 0, 32);
         Is_0088 = tmp_str000A;
         Gd_0022 = 0;
         if((Risk != 0))
           {
            Gd_0023 = (AccountBalance() / 30000);
            Gd_0024 = fabs(Risk);
            Gd_0022 = NormalizeDouble((Id_0008 * NormalizeDouble((Gd_0023 * Gd_0024), 2)), Ii_0060);
           }
         else
           {
            Gd_0022 = Id_0008;
           }
         if((Gd_0022 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Gd_0022 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Gd_0022 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Gd_0022 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         Id_0080 = Gd_0022;
         if((Gd_0022 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Id_0080 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Id_0080 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Id_0080 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         if(Ii_0064 < 1)
           {
            Gl_0024 = TimeCurrent();
            Gi_0025 = Ii_004C * 60;
            Gl_0025 = Gi_0025;
            Gl_0025 = Il_01D8 + Gl_0025;
            if(Gl_0024 > Gl_0025)
               if(sg(1)==-1)
                 {
                  do
                    {
                     if(IsTesting() != true)
                       {
                        tmp_str000A = "品种:" + _Symbol;
                        tmp_str000A = tmp_str000A + " ,手数:";
                        tmp_str000A = tmp_str000A + DoubleToString(Id_0080, 2);
                        tmp_str000A = tmp_str000A + " ,开仓价格:";
                        tmp_str000A = tmp_str000A + DoubleToString(Bid, 4);
                        tmp_str000A = tmp_str000A + " ,注释:";
                        tmp_str000A = tmp_str000A + Is_0088;
                        tmp_str000A = tmp_str000A + " ,订单识别码:";
                        tmp_str000A = tmp_str000A + IntegerToString(Magic, 0, 32);
                        Print(tmp_str000A);
                       }
                     Ii_0064 = OrderSend(_Symbol, 1, Id_0080, Bid, slippage, 0, 0, Is_0088, Magic, 0, 255);
                     if(Ii_0064 < 1)
                       {
                        if(IsTesting() != true)
                          {
                           tmp_str000B = " ,暂停时间:" + IntegerToString(Ii_004C, 0, 32);
                           tmp_str000B = tmp_str000B + " 分钟";
                           Print("错误码:", GetLastError(), tmp_str000B);
                          }
                        Il_01D8 = TimeCurrent();
                       }
                     else
                       {
                        tmp_str000C = "sell";
                        Gd_0025 = 0;
                        Gi_0026 = OrdersTotal() - 1;
                        Gi_0027 = Gi_0026;
                        if(Gi_0026 >= 0)
                          {
                           do
                             {
                              if(OrderSelect(Gi_0027, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
                                {
                                 if(tmp_str000C == "buy" && OrderType() == OP_BUY)
                                   {
                                    Gd_0026 = ((点数b * _Point) + Id_0200);
                                    if((OrderTakeProfit() != Gd_0026))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str000D = "买单均价:" + DoubleToString(Id_0200, 4);
                                          tmp_str000D = tmp_str000D + " ,利润点位:";
                                          tmp_str000D = tmp_str000D + IntegerToString(点数b, 0, 32);
                                          tmp_str000D = tmp_str000D + " ,利润价格:";
                                          tmp_str000D = tmp_str000D + DoubleToString(Gd_0026, 4);
                                          Print(tmp_str000D);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_0026, 0, 65535);
                                      }
                                   }
                                 if(tmp_str000C == "sell" && OrderType() == OP_SELL)
                                   {
                                    Gd_002A = (点数s * _Point);
                                    Gd_002A = (Id_01F8 - Gd_002A);
                                    if((OrderTakeProfit() != Gd_002A))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str000E = "卖单均价:" + DoubleToString(Id_01F8, 4);
                                          tmp_str000E = tmp_str000E + " ,利润点位:";
                                          tmp_str000E = tmp_str000E + IntegerToString(点数s, 0, 32);
                                          tmp_str000E = tmp_str000E + " ,利润价格:";
                                          tmp_str000E = tmp_str000E + DoubleToString(Gd_002A, 4);
                                          Print(tmp_str000E);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_002A, 0, 65535);
                                      }
                                   }
                                }
                              Gi_0027 = Gi_0027 - 1;
                             }
                           while(Gi_0027 >= 0);
                          }
                       }
                     RefreshRates();
                     if(Ii_0064 >= 1)
                        break;
                     Gl_002D = TimeCurrent();
                     Gi_002E = Ii_004C * 60;
                     Gl_002E = Gi_002E;
                     Gl_002E = Il_01D8 + Gl_002E;
                    }
                  while(Gl_002D > Gl_002E);
                 }
           }
        }
      Il_0050 = iTime(NULL, Ii_0044, 0);
     }
   if(Il_0058 == iTime(NULL, Ii_0048, 0))
      return;
   Ii_0064 = 0;
   if(Ii_00D0 > 0)
     {
      tmp_str000F = "buy";
      if(func_1013(tmp_str000F) != 0 && Ib_0098 && Ib_0094)
        {
         tmp_str0010 = Is_0038 + IntegerToString(Magic, 0, 32);
         tmp_str0010 = tmp_str0010 + " _Buy ";
         Gi_002E = Ii_00D0 + 1;
         tmp_str0010 = tmp_str0010 + IntegerToString(Gi_002E, 0, 32);
         Is_0088 = tmp_str0010;
         tmp_str0010 = "buy";
         Id_0068 = func_1011(tmp_str0010);
         if((Id_0068 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Id_0068 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Id_0068 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Id_0068 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         if(Ii_0064 < 1)
           {
            Gl_002E = TimeCurrent();
            Gi_002F = Ii_004C * 60;
            Gl_002F = Gi_002F;
            Gl_002F = Il_01F0 + Gl_002F;
            if(Gl_002E > Gl_002F)
              {
               do
                  if(sg(0)==1)
                    {
                     if(IsTesting() != true)
                       {
                        tmp_str0011 = "品种:" + _Symbol;
                        tmp_str0011 = tmp_str0011 + " ,手数:";
                        tmp_str0011 = tmp_str0011 + DoubleToString(Id_0068, 2);
                        tmp_str0011 = tmp_str0011 + " ,开仓价格:";
                        tmp_str0011 = tmp_str0011 + DoubleToString(Ask, 4);
                        tmp_str0011 = tmp_str0011 + " ,注释:";
                        tmp_str0011 = tmp_str0011 + Is_0088;
                        tmp_str0011 = tmp_str0011 + " ,订单识别码:";
                        tmp_str0011 = tmp_str0011 + IntegerToString(Magic, 0, 32);
                        Print(tmp_str0011);
                       }
                     Ii_0064 = OrderSend(_Symbol, 0, Id_0068, Ask, slippage, 0, 0, Is_0088, Magic, 0, 16711680);
                     if(Ii_0064 < 1)
                       {
                        if(IsTesting() != true)
                          {
                           tmp_str0012 = " ,暂停时间:" + IntegerToString(Ii_004C, 0, 32);
                           tmp_str0012 = tmp_str0012 + " 分钟";
                           Print("错误码:", GetLastError(), tmp_str0012);
                          }
                        Il_01F0 = TimeCurrent();
                       }
                     else
                       {
                        tmp_str0013 = "buy";
                        Gd_002F = 0;
                        Gi_0030 = OrdersTotal() - 1;
                        Gi_0031 = Gi_0030;
                        if(Gi_0030 >= 0)
                          {
                           do
                             {
                              if(OrderSelect(Gi_0031, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
                                {
                                 if(tmp_str0013 == "buy" && OrderType() == OP_BUY)
                                   {
                                    Gd_0030 = ((点数b * _Point) + Id_0200);
                                    if((OrderTakeProfit() != Gd_0030))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str0014 = "买单均价:" + DoubleToString(Id_0200, 4);
                                          tmp_str0014 = tmp_str0014 + " ,利润点位:";
                                          tmp_str0014 = tmp_str0014 + IntegerToString(点数b, 0, 32);
                                          tmp_str0014 = tmp_str0014 + " ,利润价格:";
                                          tmp_str0014 = tmp_str0014 + DoubleToString(Gd_0030, 4);
                                          Print(tmp_str0014);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_0030, 0, 65535);
                                      }
                                   }
                                 if(tmp_str0013 == "sell" && OrderType() == OP_SELL)
                                   {
                                    Gd_0034 = (点数s * _Point);
                                    Gd_0034 = (Id_01F8 - Gd_0034);
                                    if((OrderTakeProfit() != Gd_0034))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str0015 = "卖单均价:" + DoubleToString(Id_01F8, 4);
                                          tmp_str0015 = tmp_str0015 + " ,利润点位:";
                                          tmp_str0015 = tmp_str0015 + IntegerToString(点数s, 0, 32);
                                          tmp_str0015 = tmp_str0015 + " ,利润价格:";
                                          tmp_str0015 = tmp_str0015 + DoubleToString(Gd_0034, 4);
                                          Print(tmp_str0015);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_0034, 0, 65535);
                                      }
                                   }
                                }
                              Gi_0031 = Gi_0031 - 1;
                             }
                           while(Gi_0031 >= 0);
                          }
                       }
                     RefreshRates();
                     if(Ii_0064 >= 1)
                        break;
                     Gl_0037 = TimeCurrent();
                     Gi_0038 = Ii_004C * 60;
                     Gl_0038 = Gi_0038;
                     Gl_0038 = Il_01F0 + Gl_0038;
                    }
               while(Gl_0037 > Gl_0038);
              }
           }
        }
     }
   if(Ii_00D4 > 0)
     {
      tmp_str0016 = "sell";
      if(func_1013(tmp_str0016) != 0 && Ib_0097 && Ib_0094)
        {
         tmp_str0017 = Is_0038 + IntegerToString(Magic, 0, 32);
         tmp_str0017 = tmp_str0017 + " _Sell ";
         Gi_0038 = Ii_00D4 + 1;
         tmp_str0017 = tmp_str0017 + IntegerToString(Gi_0038, 0, 32);
         Is_0088 = tmp_str0017;
         tmp_str0017 = "sell";
         Id_0070 = func_1011(tmp_str0017);
         if((Id_0070 < MarketInfo(_Symbol, MODE_MINLOT)))
           {
            Id_0070 = MarketInfo(_Symbol, MODE_MINLOT);
           }
         if((Id_0070 > MarketInfo(_Symbol, MODE_MAXLOT)))
           {
            Id_0070 = MarketInfo(_Symbol, MODE_MAXLOT);
           }
         if(Ii_0064 < 1)
           {
            Gl_0038 = TimeCurrent();
            Gi_0039 = Ii_004C * 60;
            Gl_0039 = Gi_0039;
            Gl_0039 = Il_01E8 + Gl_0039;
            if(Gl_0038 > Gl_0039)
              {
               do
                  if(sg(1)==-1)
                    {
                     if(IsTesting() != true)
                       {
                        tmp_str0018 = "品种:" + _Symbol;
                        tmp_str0018 = tmp_str0018 + " ,手数:";
                        tmp_str0018 = tmp_str0018 + DoubleToString(Id_0070, 2);
                        tmp_str0018 = tmp_str0018 + " ,开仓价格:";
                        tmp_str0018 = tmp_str0018 + DoubleToString(Bid, 4);
                        tmp_str0018 = tmp_str0018 + " ,注释:";
                        tmp_str0018 = tmp_str0018 + Is_0088;
                        tmp_str0018 = tmp_str0018 + " ,订单识别码:";
                        tmp_str0018 = tmp_str0018 + IntegerToString(Magic, 0, 32);
                        Print(tmp_str0018);
                       }
                     Ii_0064 = OrderSend(_Symbol, 1, Id_0070, Bid, slippage, 0, 0, Is_0088, Magic, 0, 255);
                     if(Ii_0064 < 1)
                       {
                        if(IsTesting() != true)
                          {
                           tmp_str0019 = " ,暂停时间:" + IntegerToString(Ii_004C, 0, 32);
                           tmp_str0019 = tmp_str0019 + " 分钟";
                           Print("错误码:", GetLastError(), tmp_str0019);
                          }
                        Il_01E8 = TimeCurrent();
                       }
                     else
                       {
                        tmp_str001A = "sell";
                        Gd_0039 = 0;
                        Gi_003A = OrdersTotal() - 1;
                        Gi_003B = Gi_003A;
                        if(Gi_003A >= 0)
                          {
                           do
                             {
                              if(OrderSelect(Gi_003B, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
                                {
                                 if(tmp_str001A == "buy" && OrderType() == OP_BUY)
                                   {
                                    Gd_003A = ((点数b * _Point) + Id_0200);
                                    if((OrderTakeProfit() != Gd_003A))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str001B = "买单均价:" + DoubleToString(Id_0200, 4);
                                          tmp_str001B = tmp_str001B + " ,利润点位:";
                                          tmp_str001B = tmp_str001B + IntegerToString(点数b, 0, 32);
                                          tmp_str001B = tmp_str001B + " ,利润价格:";
                                          tmp_str001B = tmp_str001B + DoubleToString(Gd_003A, 4);
                                          Print(tmp_str001B);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_003A, 0, 65535);
                                      }
                                   }
                                 if(tmp_str001A == "sell" && OrderType() == OP_SELL)
                                   {
                                    Gd_003E = (点数s * _Point);
                                    Gd_003E = (Id_01F8 - Gd_003E);
                                    if((OrderTakeProfit() != Gd_003E))
                                      {
                                       if(IsTesting() != true)
                                         {
                                          tmp_str001C = "卖单均价:" + DoubleToString(Id_01F8, 4);
                                          tmp_str001C = tmp_str001C + " ,利润点位:";
                                          tmp_str001C = tmp_str001C + IntegerToString(点数s, 0, 32);
                                          tmp_str001C = tmp_str001C + " ,利润价格:";
                                          tmp_str001C = tmp_str001C + DoubleToString(Gd_003E, 4);
                                          Print(tmp_str001C);
                                         }
                                       Ii_009C = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Gd_003E, 0, 65535);
                                      }
                                   }
                                }
                              Gi_003B = Gi_003B - 1;
                             }
                           while(Gi_003B >= 0);
                          }
                       }
                     RefreshRates();
                     if(Ii_0064 >= 1)
                        break;
                     Gl_0041 = TimeCurrent();
                     Gi_0042 = Ii_004C * 60;
                     Gl_0042 = Gi_0042;
                     Gl_0042 = Il_01E8 + Gl_0042;
                    }
               while(Gl_0041 > Gl_0042);
              }
           }
        }
     }
   Il_0058 = iTime(NULL, Ii_0048, 0);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0, -1);
   EventKillTimer();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   set();
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   string tmp_str0004;
   string tmp_str0005;
   string tmp_str0006;
   string tmp_str0007;
   string tmp_str0008;
   string tmp_str0009;
   string tmp_str000A;
   string tmp_str000B;
   string tmp_str000C;
   string tmp_str000D;
   string tmp_str000E;
   string tmp_str000F;
   string tmp_str0010;
   string tmp_str0011;
   string tmp_str0012;
   string tmp_str0013;
   string tmp_str0014;
   string tmp_str0015;
   string tmp_str0016;
   string tmp_str0017;
   string tmp_str0018;
   string tmp_str0019;
   string tmp_str001A;

   Gb_0000 = false;
   Gi_0001 = 2237106;
   Gi_0002 = 16777215;
   tmp_str0000 = "停止EA";
   tmp_str0001 = "停止EA";
   tmp_str0002 = "Button3";
   if(ObjectFind(0, tmp_str0002) == -1)
     {
      ObjectCreate(0, tmp_str0002, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0002, 102, 120);
      ObjectSetInteger(0, tmp_str0002, 103, 25);
      ObjectSetInteger(0, tmp_str0002, 1019, 120);
      ObjectSetInteger(0, tmp_str0002, 1020, 25);
      ObjectSetInteger(0, tmp_str0002, 101, 3);
      ObjectSetString(0, tmp_str0002, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0002, 100, 10);
      ObjectSetInteger(0, tmp_str0002, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0002, 1018, 0) == 1)
     {
      if(Gb_0000)
        {
         ObjectSetInteger(0, tmp_str0002, 6, Gi_0001);
         ObjectSetInteger(0, tmp_str0002, 1025, Gi_0002);
        }
      ObjectSetString(0, tmp_str0002, 999, tmp_str0000);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0002, 6, Gi_0002);
      ObjectSetInteger(0, tmp_str0002, 1025, Gi_0001);
      ObjectSetString(0, tmp_str0002, 999, tmp_str0001);
     }
   if(ObjectGetInteger(0, "Button3", 1018, 0) == 1)
     {
      ExpertRemove();
      return ;
     }
   Gb_0003 = false;
   Gi_0004 = 36095;
   Gi_0005 = 16777215;
   tmp_str0003 = "正常下单";
   tmp_str0004 = "暂停下单";
   tmp_str0005 = "Button4";
   if(ObjectFind(0, tmp_str0005) == -1)
     {
      ObjectCreate(0, tmp_str0005, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0005, 102, 120);
      ObjectSetInteger(0, tmp_str0005, 103, 50);
      ObjectSetInteger(0, tmp_str0005, 1019, 120);
      ObjectSetInteger(0, tmp_str0005, 1020, 25);
      ObjectSetInteger(0, tmp_str0005, 101, 3);
      ObjectSetString(0, tmp_str0005, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0005, 100, 10);
      ObjectSetInteger(0, tmp_str0005, 1035, 42495);
     }
   if(ObjectGetInteger(0, tmp_str0005, 1018, 0) == 1)
     {
      if(Gb_0003)
        {
         ObjectSetInteger(0, tmp_str0005, 6, Gi_0004);
         ObjectSetInteger(0, tmp_str0005, 1025, Gi_0005);
        }
      ObjectSetString(0, tmp_str0005, 999, tmp_str0003);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0005, 6, Gi_0005);
      ObjectSetInteger(0, tmp_str0005, 1025, Gi_0004);
      ObjectSetString(0, tmp_str0005, 999, tmp_str0004);
     }
   if(ObjectGetInteger(0, "Button4", 1018, 0) == 1)
     {
      Ib_0094 = false;
     }
   else
     {
      Ib_0094 = true;
     }
   Gb_0006 = false;
   Gi_0007 = 14772545;
   Gi_0008 = 16777215;
   tmp_str0006 = "正在执行";
   tmp_str0007 = "全部平仓";
   tmp_str0008 = "Button0";
   if(ObjectFind(0, tmp_str0008) == -1)
     {
      ObjectCreate(0, tmp_str0008, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0008, 102, 120);
      ObjectSetInteger(0, tmp_str0008, 103, 75);
      ObjectSetInteger(0, tmp_str0008, 1019, 120);
      ObjectSetInteger(0, tmp_str0008, 1020, 25);
      ObjectSetInteger(0, tmp_str0008, 101, 3);
      ObjectSetString(0, tmp_str0008, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0008, 100, 10);
      ObjectSetInteger(0, tmp_str0008, 1035, 16748574);
     }
   if(ObjectGetInteger(0, tmp_str0008, 1018, 0) == 1)
     {
      if(Gb_0006)
        {
         ObjectSetInteger(0, tmp_str0008, 6, Gi_0007);
         ObjectSetInteger(0, tmp_str0008, 1025, Gi_0008);
        }
      ObjectSetString(0, tmp_str0008, 999, tmp_str0006);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0008, 6, Gi_0008);
      ObjectSetInteger(0, tmp_str0008, 1025, Gi_0007);
      ObjectSetString(0, tmp_str0008, 999, tmp_str0007);
     }
   if(ObjectGetInteger(0, "Button0", 1018, 0) == 1)
     {
      Gi_0009 = 0;
      Gi_000A = OrdersTotal() - 1;
      Gi_000B = Gi_000A;
      if(Gi_000A >= 0)
        {
         do
           {
            if(OrderSelect(Gi_000B, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_0009 == 1 || Gi_0009 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_0009 == 2 || Gi_0009 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_000F = Gi_000B - 1;
            Gi_000B = Gi_000F;
           }
         while(Gi_000F >= 0);
        }
      ObjectSetInteger(0, "Button0", 1018, 0);
     }
   Gb_000F = false;
   Gi_0010 = 2237106;
   Gi_0011 = 16777215;
   tmp_str0009 = "正在执行";
   tmp_str000A = "空单平仓";
   tmp_str000B = "Button1";
   if(ObjectFind(0, tmp_str000B) == -1)
     {
      ObjectCreate(0, tmp_str000B, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str000B, 102, 120);
      ObjectSetInteger(0, tmp_str000B, 103, 100);
      ObjectSetInteger(0, tmp_str000B, 1019, 120);
      ObjectSetInteger(0, tmp_str000B, 1020, 25);
      ObjectSetInteger(0, tmp_str000B, 101, 3);
      ObjectSetString(0, tmp_str000B, 1001, "Arial");
      ObjectSetInteger(0, tmp_str000B, 100, 10);
      ObjectSetInteger(0, tmp_str000B, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str000B, 1018, 0) == 1)
     {
      if(Gb_000F)
        {
         ObjectSetInteger(0, tmp_str000B, 6, Gi_0010);
         ObjectSetInteger(0, tmp_str000B, 1025, Gi_0011);
        }
      ObjectSetString(0, tmp_str000B, 999, tmp_str0009);
     }
   else
     {
      ObjectSetInteger(0, tmp_str000B, 6, Gi_0011);
      ObjectSetInteger(0, tmp_str000B, 1025, Gi_0010);
      ObjectSetString(0, tmp_str000B, 999, tmp_str000A);
     }
   if(ObjectGetInteger(0, "Button1", 1018, 0) == 1)
     {
      Gi_0012 = 2;
      Gi_0013 = OrdersTotal() - 1;
      Gi_0014 = Gi_0013;
      if(Gi_0013 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0014, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_0012 == 1 || Gi_0012 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_0012 == 2 || Gi_0012 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_0018 = Gi_0014 - 1;
            Gi_0014 = Gi_0018;
           }
         while(Gi_0018 >= 0);
        }
      ObjectSetInteger(0, "Button1", 1018, 0);
     }
   Gb_0018 = false;
   Gi_0019 = 2263842;
   Gi_001A = 16777215;
   tmp_str000C = "正在执行";
   tmp_str000D = "多单平仓";
   tmp_str000E = "Button2";
   if(ObjectFind(0, tmp_str000E) == -1)
     {
      ObjectCreate(0, tmp_str000E, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str000E, 102, 120);
      ObjectSetInteger(0, tmp_str000E, 103, 125);
      ObjectSetInteger(0, tmp_str000E, 1019, 120);
      ObjectSetInteger(0, tmp_str000E, 1020, 25);
      ObjectSetInteger(0, tmp_str000E, 101, 3);
      ObjectSetString(0, tmp_str000E, 1001, "Arial");
      ObjectSetInteger(0, tmp_str000E, 100, 10);
      ObjectSetInteger(0, tmp_str000E, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str000E, 1018, 0) == 1)
     {
      if(Gb_0018)
        {
         ObjectSetInteger(0, tmp_str000E, 6, Gi_0019);
         ObjectSetInteger(0, tmp_str000E, 1025, Gi_001A);
        }
      ObjectSetString(0, tmp_str000E, 999, tmp_str000C);
     }
   else
     {
      ObjectSetInteger(0, tmp_str000E, 6, Gi_001A);
      ObjectSetInteger(0, tmp_str000E, 1025, Gi_0019);
      ObjectSetString(0, tmp_str000E, 999, tmp_str000D);
     }
   if(ObjectGetInteger(0, "Button2", 1018, 0) == 1)
     {
      Gi_001B = 1;
      Gi_001C = OrdersTotal() - 1;
      Gi_001D = Gi_001C;
      if(Gi_001C >= 0)
        {
         do
           {
            if(OrderSelect(Gi_001D, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_001B == 1 || Gi_001B == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_001B == 2 || Gi_001B == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_0021 = Gi_001D - 1;
            Gi_001D = Gi_0021;
           }
         while(Gi_0021 >= 0);
        }
      ObjectSetInteger(0, "Button2", 1018, 0);
     }
   Gb_0021 = false;
   Gi_0022 = 2237106;
   Gi_0023 = 16777215;
   tmp_str000F = "正在执行";
   tmp_str0010 = "手工加空";
   tmp_str0011 = "Button5";
   if(ObjectFind(0, tmp_str0011) == -1)
     {
      ObjectCreate(0, tmp_str0011, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0011, 102, 120);
      ObjectSetInteger(0, tmp_str0011, 103, 150);
      ObjectSetInteger(0, tmp_str0011, 1019, 120);
      ObjectSetInteger(0, tmp_str0011, 1020, 25);
      ObjectSetInteger(0, tmp_str0011, 101, 3);
      ObjectSetString(0, tmp_str0011, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0011, 100, 10);
      ObjectSetInteger(0, tmp_str0011, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0011, 1018, 0) == 1)
     {
      if(Gb_0021)
        {
         ObjectSetInteger(0, tmp_str0011, 6, Gi_0022);
         ObjectSetInteger(0, tmp_str0011, 1025, Gi_0023);
        }
      ObjectSetString(0, tmp_str0011, 999, tmp_str000F);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0011, 6, Gi_0023);
      ObjectSetInteger(0, tmp_str0011, 1025, Gi_0022);
      ObjectSetString(0, tmp_str0011, 999, tmp_str0010);
     }
   if(ObjectGetInteger(0, "Button5", 1018, 0) == 1)
     {
      Ib_0096 = true;
      ObjectSetInteger(0, "Button5", 1018, 0);
     }
   Gb_0024 = false;
   Gi_0025 = 2263842;
   Gi_0026 = 16777215;
   tmp_str0012 = "正在执行";
   tmp_str0013 = "手工加多";
   tmp_str0014 = "Button6";
   if(ObjectFind(0, tmp_str0014) == -1)
     {
      ObjectCreate(0, tmp_str0014, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0014, 102, 120);
      ObjectSetInteger(0, tmp_str0014, 103, 175);
      ObjectSetInteger(0, tmp_str0014, 1019, 120);
      ObjectSetInteger(0, tmp_str0014, 1020, 25);
      ObjectSetInteger(0, tmp_str0014, 101, 3);
      ObjectSetString(0, tmp_str0014, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0014, 100, 10);
      ObjectSetInteger(0, tmp_str0014, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str0014, 1018, 0) == 1)
     {
      if(Gb_0024)
        {
         ObjectSetInteger(0, tmp_str0014, 6, Gi_0025);
         ObjectSetInteger(0, tmp_str0014, 1025, Gi_0026);
        }
      ObjectSetString(0, tmp_str0014, 999, tmp_str0012);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0014, 6, Gi_0026);
      ObjectSetInteger(0, tmp_str0014, 1025, Gi_0025);
      ObjectSetString(0, tmp_str0014, 999, tmp_str0013);
     }
   if(ObjectGetInteger(0, "Button6", 1018, 0) == 1)
     {
      Ib_0095 = true;
      ObjectSetInteger(0, "Button6", 1018, 0);
     }
   Gb_0027 = false;
   Gi_0028 = 2237106;
   Gi_0029 = 16777215;
   tmp_str0015 = "允许空单";
   tmp_str0016 = "空单暂停";
   tmp_str0017 = "Button7";
   if(ObjectFind(0, tmp_str0017) == -1)
     {
      ObjectCreate(0, tmp_str0017, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0017, 102, 120);
      ObjectSetInteger(0, tmp_str0017, 103, 200);
      ObjectSetInteger(0, tmp_str0017, 1019, 120);
      ObjectSetInteger(0, tmp_str0017, 1020, 25);
      ObjectSetInteger(0, tmp_str0017, 101, 3);
      ObjectSetString(0, tmp_str0017, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0017, 100, 10);
      ObjectSetInteger(0, tmp_str0017, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0017, 1018, 0) == 1)
     {
      if(Gb_0027)
        {
         ObjectSetInteger(0, tmp_str0017, 6, Gi_0028);
         ObjectSetInteger(0, tmp_str0017, 1025, Gi_0029);
        }
      ObjectSetString(0, tmp_str0017, 999, tmp_str0015);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0017, 6, Gi_0029);
      ObjectSetInteger(0, tmp_str0017, 1025, Gi_0028);
      ObjectSetString(0, tmp_str0017, 999, tmp_str0016);
     }
   if(ObjectGetInteger(0, "Button7", 1018, 0) == 1)
     {
      Ib_0097 = false;
     }
   else
     {
      Ib_0097 = true;
     }
   Gb_002A = false;
   Gi_002B = 2263842;
   Gi_002C = 16777215;
   tmp_str0018 = "允许多单";
   tmp_str0019 = "多单暂停";
   tmp_str001A = "Button8";
   if(ObjectFind(0, tmp_str001A) == -1)
     {
      ObjectCreate(0, tmp_str001A, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str001A, 102, 120);
      ObjectSetInteger(0, tmp_str001A, 103, 225);
      ObjectSetInteger(0, tmp_str001A, 1019, 120);
      ObjectSetInteger(0, tmp_str001A, 1020, 25);
      ObjectSetInteger(0, tmp_str001A, 101, 3);
      ObjectSetString(0, tmp_str001A, 1001, "Arial");
      ObjectSetInteger(0, tmp_str001A, 100, 10);
      ObjectSetInteger(0, tmp_str001A, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str001A, 1018, 0) == 1)
     {
      if(Gb_002A)
        {
         ObjectSetInteger(0, tmp_str001A, 6, Gi_002B);
         ObjectSetInteger(0, tmp_str001A, 1025, Gi_002C);
        }
      ObjectSetString(0, tmp_str001A, 999, tmp_str0018);
     }
   else
     {
      ObjectSetInteger(0, tmp_str001A, 6, Gi_002C);
      ObjectSetInteger(0, tmp_str001A, 1025, Gi_002B);
      ObjectSetString(0, tmp_str001A, 999, tmp_str0019);
     }
   if(ObjectGetInteger(0, "Button8", 1018, 0) == 1)
     {
      Ib_0098 = false;
      return ;
     }
   Ib_0098 = true;

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   string tmp_str0004;
   string tmp_str0005;
   string tmp_str0006;
   string tmp_str0007;
   string tmp_str0008;
   string tmp_str0009;
   string tmp_str000A;
   string tmp_str000B;
   string tmp_str000C;
   string tmp_str000D;
   string tmp_str000E;
   string tmp_str000F;
   string tmp_str0010;
   string tmp_str0011;
   string tmp_str0012;
   string tmp_str0013;
   string tmp_str0014;
   string tmp_str0015;
   string tmp_str0016;
   string tmp_str0017;
   string tmp_str0018;
   string tmp_str0019;
   string tmp_str001A;
   double Ld_FFF8;

   Gb_0000 = false;
   Gi_0001 = 2237106;
   Gi_0002 = 16777215;
   tmp_str0000 = "停止EA";
   tmp_str0001 = "停止EA";
   tmp_str0002 = "Button0";
   if(ObjectFind(0, tmp_str0002) == -1)
     {
      ObjectCreate(0, tmp_str0002, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0002, 102, 120);
      ObjectSetInteger(0, tmp_str0002, 103, 25);
      ObjectSetInteger(0, tmp_str0002, 1019, 120);
      ObjectSetInteger(0, tmp_str0002, 1020, 25);
      ObjectSetInteger(0, tmp_str0002, 101, 3);
      ObjectSetString(0, tmp_str0002, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0002, 100, 10);
      ObjectSetInteger(0, tmp_str0002, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0002, 1018, 0) == 1)
     {
      if(Gb_0000)
        {
         ObjectSetInteger(0, tmp_str0002, 6, Gi_0001);
         ObjectSetInteger(0, tmp_str0002, 1025, Gi_0002);
        }
      ObjectSetString(0, tmp_str0002, 999, tmp_str0000);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0002, 6, Gi_0002);
      ObjectSetInteger(0, tmp_str0002, 1025, Gi_0001);
      ObjectSetString(0, tmp_str0002, 999, tmp_str0001);
     }
   if(ObjectGetInteger(0, "Button0", 1018, 0) == 1)
     {
      ExpertRemove();
      Ld_FFF8 = 0;
      return Ld_FFF8;
     }
   Gb_0003 = false;
   Gi_0004 = 36095;
   Gi_0005 = 16777215;
   tmp_str0003 = "正常下单";
   tmp_str0004 = "暂停下单";
   tmp_str0005 = "Button1";
   if(ObjectFind(0, tmp_str0005) == -1)
     {
      ObjectCreate(0, tmp_str0005, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0005, 102, 120);
      ObjectSetInteger(0, tmp_str0005, 103, 50);
      ObjectSetInteger(0, tmp_str0005, 1019, 120);
      ObjectSetInteger(0, tmp_str0005, 1020, 25);
      ObjectSetInteger(0, tmp_str0005, 101, 3);
      ObjectSetString(0, tmp_str0005, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0005, 100, 10);
      ObjectSetInteger(0, tmp_str0005, 1035, 42495);
     }
   if(ObjectGetInteger(0, tmp_str0005, 1018, 0) == 1)
     {
      if(Gb_0003)
        {
         ObjectSetInteger(0, tmp_str0005, 6, Gi_0004);
         ObjectSetInteger(0, tmp_str0005, 1025, Gi_0005);
        }
      ObjectSetString(0, tmp_str0005, 999, tmp_str0003);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0005, 6, Gi_0005);
      ObjectSetInteger(0, tmp_str0005, 1025, Gi_0004);
      ObjectSetString(0, tmp_str0005, 999, tmp_str0004);
     }
   if(ObjectGetInteger(0, "Button1", 1018, 0) == 1)
     {
      Ib_0094 = false;
     }
   else
     {
      Ib_0094 = true;
     }
   Gb_0006 = false;
   Gi_0007 = 14772545;
   Gi_0008 = 16777215;
   tmp_str0006 = "正在执行";
   tmp_str0007 = "全部平仓";
   tmp_str0008 = "Button2";
   if(ObjectFind(0, tmp_str0008) == -1)
     {
      ObjectCreate(0, tmp_str0008, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0008, 102, 120);
      ObjectSetInteger(0, tmp_str0008, 103, 75);
      ObjectSetInteger(0, tmp_str0008, 1019, 120);
      ObjectSetInteger(0, tmp_str0008, 1020, 25);
      ObjectSetInteger(0, tmp_str0008, 101, 3);
      ObjectSetString(0, tmp_str0008, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0008, 100, 10);
      ObjectSetInteger(0, tmp_str0008, 1035, 16748574);
     }
   if(ObjectGetInteger(0, tmp_str0008, 1018, 0) == 1)
     {
      if(Gb_0006)
        {
         ObjectSetInteger(0, tmp_str0008, 6, Gi_0007);
         ObjectSetInteger(0, tmp_str0008, 1025, Gi_0008);
        }
      ObjectSetString(0, tmp_str0008, 999, tmp_str0006);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0008, 6, Gi_0008);
      ObjectSetInteger(0, tmp_str0008, 1025, Gi_0007);
      ObjectSetString(0, tmp_str0008, 999, tmp_str0007);
     }
   if(ObjectGetInteger(0, "Button2", 1018, 0) == 1)
     {
      Gi_0009 = 0;
      Gi_000A = OrdersTotal() - 1;
      Gi_000B = Gi_000A;
      if(Gi_000A >= 0)
        {
         do
           {
            if(OrderSelect(Gi_000B, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_0009 == 1 || Gi_0009 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_0009 == 2 || Gi_0009 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_000F = Gi_000B - 1;
            Gi_000B = Gi_000F;
           }
         while(Gi_000F >= 0);
        }
      ObjectSetInteger(0, "Button2", 1018, 0);
     }
   Gb_000F = false;
   Gi_0010 = 2237106;
   Gi_0011 = 16777215;
   tmp_str0009 = "正在执行";
   tmp_str000A = "空单平仓";
   tmp_str000B = "Button3";
   if(ObjectFind(0, tmp_str000B) == -1)
     {
      ObjectCreate(0, tmp_str000B, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str000B, 102, 120);
      ObjectSetInteger(0, tmp_str000B, 103, 100);
      ObjectSetInteger(0, tmp_str000B, 1019, 120);
      ObjectSetInteger(0, tmp_str000B, 1020, 25);
      ObjectSetInteger(0, tmp_str000B, 101, 3);
      ObjectSetString(0, tmp_str000B, 1001, "Arial");
      ObjectSetInteger(0, tmp_str000B, 100, 10);
      ObjectSetInteger(0, tmp_str000B, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str000B, 1018, 0) == 1)
     {
      if(Gb_000F)
        {
         ObjectSetInteger(0, tmp_str000B, 6, Gi_0010);
         ObjectSetInteger(0, tmp_str000B, 1025, Gi_0011);
        }
      ObjectSetString(0, tmp_str000B, 999, tmp_str0009);
     }
   else
     {
      ObjectSetInteger(0, tmp_str000B, 6, Gi_0011);
      ObjectSetInteger(0, tmp_str000B, 1025, Gi_0010);
      ObjectSetString(0, tmp_str000B, 999, tmp_str000A);
     }
   if(ObjectGetInteger(0, "Button3", 1018, 0) == 1)
     {
      Gi_0012 = 2;
      Gi_0013 = OrdersTotal() - 1;
      Gi_0014 = Gi_0013;
      if(Gi_0013 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0014, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_0012 == 1 || Gi_0012 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_0012 == 2 || Gi_0012 == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_0018 = Gi_0014 - 1;
            Gi_0014 = Gi_0018;
           }
         while(Gi_0018 >= 0);
        }
      ObjectSetInteger(0, "Button3", 1018, 0);
     }
   Gb_0018 = false;
   Gi_0019 = 2263842;
   Gi_001A = 16777215;
   tmp_str000C = "正在执行";
   tmp_str000D = "多单平仓";
   tmp_str000E = "Button4";
   if(ObjectFind(0, tmp_str000E) == -1)
     {
      ObjectCreate(0, tmp_str000E, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str000E, 102, 120);
      ObjectSetInteger(0, tmp_str000E, 103, 125);
      ObjectSetInteger(0, tmp_str000E, 1019, 120);
      ObjectSetInteger(0, tmp_str000E, 1020, 25);
      ObjectSetInteger(0, tmp_str000E, 101, 3);
      ObjectSetString(0, tmp_str000E, 1001, "Arial");
      ObjectSetInteger(0, tmp_str000E, 100, 10);
      ObjectSetInteger(0, tmp_str000E, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str000E, 1018, 0) == 1)
     {
      if(Gb_0018)
        {
         ObjectSetInteger(0, tmp_str000E, 6, Gi_0019);
         ObjectSetInteger(0, tmp_str000E, 1025, Gi_001A);
        }
      ObjectSetString(0, tmp_str000E, 999, tmp_str000C);
     }
   else
     {
      ObjectSetInteger(0, tmp_str000E, 6, Gi_001A);
      ObjectSetInteger(0, tmp_str000E, 1025, Gi_0019);
      ObjectSetString(0, tmp_str000E, 999, tmp_str000D);
     }
   if(ObjectGetInteger(0, "Button4", 1018, 0) == 1)
     {
      Gi_001B = 1;
      Gi_001C = OrdersTotal() - 1;
      Gi_001D = Gi_001C;
      if(Gi_001C >= 0)
        {
         do
           {
            if(OrderSelect(Gi_001D, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(OrderType() == OP_BUY)
                 {
                  if(Gi_001B == 1 || Gi_001B == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), slippage, 16711680);
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  if(Gi_001B == 2 || Gi_001B == 0)
                    {

                     order_check = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), slippage, 255);
                    }
                 }
               if(Ii_009C < 0)
                 {
                  Print("平仓失败，错误码->", GetLastError());
                 }
              }
            Gi_0021 = Gi_001D - 1;
            Gi_001D = Gi_0021;
           }
         while(Gi_0021 >= 0);
        }
      ObjectSetInteger(0, "Button4", 1018, 0);
     }
   Gb_0021 = false;
   Gi_0022 = 2237106;
   Gi_0023 = 16777215;
   tmp_str000F = "正在执行";
   tmp_str0010 = "手工加空";
   tmp_str0011 = "Button5";
   if(ObjectFind(0, tmp_str0011) == -1)
     {
      ObjectCreate(0, tmp_str0011, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0011, 102, 120);
      ObjectSetInteger(0, tmp_str0011, 103, 150);
      ObjectSetInteger(0, tmp_str0011, 1019, 120);
      ObjectSetInteger(0, tmp_str0011, 1020, 25);
      ObjectSetInteger(0, tmp_str0011, 101, 3);
      ObjectSetString(0, tmp_str0011, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0011, 100, 10);
      ObjectSetInteger(0, tmp_str0011, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0011, 1018, 0) == 1)
     {
      if(Gb_0021)
        {
         ObjectSetInteger(0, tmp_str0011, 6, Gi_0022);
         ObjectSetInteger(0, tmp_str0011, 1025, Gi_0023);
        }
      ObjectSetString(0, tmp_str0011, 999, tmp_str000F);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0011, 6, Gi_0023);
      ObjectSetInteger(0, tmp_str0011, 1025, Gi_0022);
      ObjectSetString(0, tmp_str0011, 999, tmp_str0010);
     }
   if(ObjectGetInteger(0, "Button5", 1018, 0) == 1)
     {
      Ib_0096 = true;
      ObjectSetInteger(0, "Button5", 1018, 0);
     }
   Gb_0024 = false;
   Gi_0025 = 2263842;
   Gi_0026 = 16777215;
   tmp_str0012 = "正在执行";
   tmp_str0013 = "手工加多";
   tmp_str0014 = "Button6";
   if(ObjectFind(0, tmp_str0014) == -1)
     {
      ObjectCreate(0, tmp_str0014, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0014, 102, 120);
      ObjectSetInteger(0, tmp_str0014, 103, 175);
      ObjectSetInteger(0, tmp_str0014, 1019, 120);
      ObjectSetInteger(0, tmp_str0014, 1020, 25);
      ObjectSetInteger(0, tmp_str0014, 101, 3);
      ObjectSetString(0, tmp_str0014, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0014, 100, 10);
      ObjectSetInteger(0, tmp_str0014, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str0014, 1018, 0) == 1)
     {
      if(Gb_0024)
        {
         ObjectSetInteger(0, tmp_str0014, 6, Gi_0025);
         ObjectSetInteger(0, tmp_str0014, 1025, Gi_0026);
        }
      ObjectSetString(0, tmp_str0014, 999, tmp_str0012);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0014, 6, Gi_0026);
      ObjectSetInteger(0, tmp_str0014, 1025, Gi_0025);
      ObjectSetString(0, tmp_str0014, 999, tmp_str0013);
     }
   if(ObjectGetInteger(0, "Button6", 1018, 0) == 1)
     {
      Ib_0095 = true;
      ObjectSetInteger(0, "Button6", 1018, 0);
     }
   Gb_0027 = false;
   Gi_0028 = 2237106;
   Gi_0029 = 16777215;
   tmp_str0015 = "允许空单";
   tmp_str0016 = "空单暂停";
   tmp_str0017 = "Button7";
   if(ObjectFind(0, tmp_str0017) == -1)
     {
      ObjectCreate(0, tmp_str0017, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str0017, 102, 120);
      ObjectSetInteger(0, tmp_str0017, 103, 200);
      ObjectSetInteger(0, tmp_str0017, 1019, 120);
      ObjectSetInteger(0, tmp_str0017, 1020, 25);
      ObjectSetInteger(0, tmp_str0017, 101, 3);
      ObjectSetString(0, tmp_str0017, 1001, "Arial");
      ObjectSetInteger(0, tmp_str0017, 100, 10);
      ObjectSetInteger(0, tmp_str0017, 1035, 255);
     }
   if(ObjectGetInteger(0, tmp_str0017, 1018, 0) == 1)
     {
      if(Gb_0027)
        {
         ObjectSetInteger(0, tmp_str0017, 6, Gi_0028);
         ObjectSetInteger(0, tmp_str0017, 1025, Gi_0029);
        }
      ObjectSetString(0, tmp_str0017, 999, tmp_str0015);
     }
   else
     {
      ObjectSetInteger(0, tmp_str0017, 6, Gi_0029);
      ObjectSetInteger(0, tmp_str0017, 1025, Gi_0028);
      ObjectSetString(0, tmp_str0017, 999, tmp_str0016);
     }
   if(ObjectGetInteger(0, "Button7", 1018, 0) == 1)
     {
      Ib_0097 = false;
     }
   else
     {
      Ib_0097 = true;
     }
   Gb_002A = false;
   Gi_002B = 3329330;
   Gi_002C = 16777215;
   tmp_str0018 = "允许多单";
   tmp_str0019 = "多单暂停";
   tmp_str001A = "Button8";
   if(ObjectFind(0, tmp_str001A) == -1)
     {
      ObjectCreate(0, tmp_str001A, OBJ_BUTTON, 0, 0, 0);
      ObjectSetInteger(0, tmp_str001A, 102, 120);
      ObjectSetInteger(0, tmp_str001A, 103, 225);
      ObjectSetInteger(0, tmp_str001A, 1019, 120);
      ObjectSetInteger(0, tmp_str001A, 1020, 25);
      ObjectSetInteger(0, tmp_str001A, 101, 3);
      ObjectSetString(0, tmp_str001A, 1001, "Arial");
      ObjectSetInteger(0, tmp_str001A, 100, 10);
      ObjectSetInteger(0, tmp_str001A, 1035, 3329330);
     }
   if(ObjectGetInteger(0, tmp_str001A, 1018, 0) == 1)
     {
      if(Gb_002A)
        {
         ObjectSetInteger(0, tmp_str001A, 6, Gi_002B);
         ObjectSetInteger(0, tmp_str001A, 1025, Gi_002C);
        }
      ObjectSetString(0, tmp_str001A, 999, tmp_str0018);
     }
   else
     {
      ObjectSetInteger(0, tmp_str001A, 6, Gi_002C);
      ObjectSetInteger(0, tmp_str001A, 1025, Gi_002B);
      ObjectSetString(0, tmp_str001A, 999, tmp_str0019);
     }
   if(ObjectGetInteger(0, "Button8", 1018, 0) == 1)
     {
      Ib_0098 = false;
      return 0;
     }
   Ib_0098 = true;

   Ld_FFF8 = 0;

   return Ld_FFF8;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double func_1011(string Fa_s_00)
  {
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   double Ld_FFF0;
   double Ld_FFF8;

   Ld_FFF0 = 0;
   if(Fa_s_00 == "buy")
     {
      tmp_str0000 = "Lots";
      tmp_str0001 = Fa_s_00;
      Gd_0001 = 0;
      Gd_0002 = 0;
      Gi_0003 = 0;
      Gi_0004 = OrdersTotal() - 1;
      Gi_0005 = Gi_0004;
      if(Gi_0004 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0005, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(tmp_str0001 == "buy" && OrderType() == OP_BUY && OrderTicket() > Gi_0003)
                 {
                  Gd_0001 = OrderOpenPrice();
                  Gd_0002 = OrderLots();
                  Gi_0003 = OrderTicket();
                 }
               if(tmp_str0001 == "sell" && OrderType() == OP_SELL && OrderTicket() > Gi_0003)
                 {
                  Gd_0001 = OrderOpenPrice();
                  Gd_0002 = OrderLots();
                  Gi_0003 = OrderTicket();
                 }
              }
            Gi_0005 = Gi_0005 - 1;
           }
         while(Gi_0005 >= 0);
        }
      if(tmp_str0000 == "Price")
        {
         Gd_0004 = Gd_0001;
        }
      else
        {
         if(tmp_str0000 == "Lots")
           {
            Gd_0004 = Gd_0002;
           }
         else
           {
            Gd_0004 = 0;
           }
        }
      Ld_FFF0 = NormalizeDouble((Gd_0004 * Id_0000), Ii_0060);
     }
   if(Fa_s_00 != "sell")
      return Ld_FFF0;
   tmp_str0002 = "Lots";
   tmp_str0003 = Fa_s_00;
   Gd_0007 = 0;
   Gd_0008 = 0;
   Gi_0009 = 0;
   Gi_000A = OrdersTotal() - 1;
   Gi_000B = Gi_000A;
   if(Gi_000A >= 0)
     {
      do
        {
         if(OrderSelect(Gi_000B, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
           {
            if(tmp_str0003 == "buy" && OrderType() == OP_BUY && OrderTicket() > Gi_0009)
              {
               Gd_0007 = OrderOpenPrice();
               Gd_0008 = OrderLots();
               Gi_0009 = OrderTicket();
              }
            if(tmp_str0003 == "sell" && OrderType() == OP_SELL && OrderTicket() > Gi_0009)
              {
               Gd_0007 = OrderOpenPrice();
               Gd_0008 = OrderLots();
               Gi_0009 = OrderTicket();
              }
           }
         Gi_000B = Gi_000B - 1;
        }
      while(Gi_000B >= 0);
     }
   if(tmp_str0002 == "Price")
     {
      Gd_000A = Gd_0007;
     }
   else
     {
      if(tmp_str0002 == "Lots")
        {
         Gd_000A = Gd_0008;
        }
      else
        {
         Gd_000A = 0;
        }
     }
   Ld_FFF0 = NormalizeDouble((Gd_000A * Id_0000), Ii_0060);

   Ld_FFF8 = Ld_FFF0;
   return Ld_FFF0;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int func_1013(string Fa_s_00)
  {
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   double Ld_FFF0;
   bool Lb_FFEF;
   double Ld_FFE0;
   double Ld_FFD8;
   int Li_FFFC = 0;

   Ld_FFF0 = 0;
   Lb_FFEF = false;
   Ld_FFE0 = iClose(_Symbol, Ii_0020, 1);
   Ld_FFD8 = iOpen(_Symbol, Ii_0020, 1);
   if(Fa_s_00 == "buy")
     {
      returned_double = MathPow(Id_0030, Ii_00D0);
      Gd_0000 = returned_double;
      Ld_FFF0 = NormalizeDouble((Step * Gd_0000), 0);
      if(Ii_00D0 == 7)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D0 == 8)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D0 == 9)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D0 == 10)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D0 == 11)
        {
         Ld_FFF0 = (double)Prosadka / 6;
        }
      if(Ii_00D0 == 12)
        {
         Ld_FFF0 = (double)Prosadka / 6;
        }
      if(Ii_00D0 == 13)
        {
         Ld_FFF0 = (double)Prosadka / 4;
        }
      tmp_str0000 = "Price";
      tmp_str0001 = Fa_s_00;
      Gd_0000 = 0;
      Gd_0001 = 0;
      Gi_0002 = 0;
      Gi_0003 = OrdersTotal() - 1;
      Gi_0004 = Gi_0003;
      if(Gi_0003 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0004, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(tmp_str0001 == "buy" && OrderType() == OP_BUY && OrderTicket() > Gi_0002)
                 {
                  Gd_0000 = OrderOpenPrice();
                  Gd_0001 = OrderLots();
                  Gi_0002 = OrderTicket();
                 }
               if(tmp_str0001 == "sell" && OrderType() == OP_SELL && OrderTicket() > Gi_0002)
                 {
                  Gd_0000 = OrderOpenPrice();
                  Gd_0001 = OrderLots();
                  Gi_0002 = OrderTicket();
                 }
              }
            Gi_0004 = Gi_0004 - 1;
           }
         while(Gi_0004 >= 0);
        }
      if(tmp_str0000 == "Price")
        {
         Gd_0003 = Gd_0000;
        }
      else
        {
         if(tmp_str0000 == "Lots")
           {
            Gd_0003 = Gd_0001;
           }
         else
           {
            Gd_0003 = 0;
           }
        }
      Gd_0005 = (Gd_0003 - Ask);
      if((Gd_0005 >= (Ld_FFF0 * _Point)) && Ii_00D0 < Buycount)
        {
         if(Ib_001C != false)
           {
            if((Ld_FFD8 <= Ld_FFE0))
              {
               Lb_FFEF = true;
              }
            else
              {
               Lb_FFEF = false;
              }
           }
         else
           {
            Lb_FFEF = true;
           }
        }
     }
   if(Fa_s_00 == "sell")
     {

      returned_double = MathPow(Id_0028, Ii_00D4);
      Gd_0005 = returned_double;
      Ld_FFF0 = NormalizeDouble((Step * Gd_0005), 0);
      if(Ii_00D4 == 7)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D4 == 8)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D4 == 9)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D4 == 10)
        {
         Ld_FFF0 = (double)Prosadka / 10;
        }
      if(Ii_00D4 == 11)
        {
         Ld_FFF0 = (double)Prosadka / 6;
        }
      if(Ii_00D4 == 12)
        {
         Ld_FFF0 = (double)Prosadka / 6;
        }
      if(Ii_00D4 == 13)
        {
         Ld_FFF0 = (double)Prosadka / 4;
        }
      tmp_str0002 = "Price";
      tmp_str0003 = Fa_s_00;
      Gd_0005 = 0;
      Gd_0006 = 0;
      Gi_0007 = 0;
      Gi_0008 = OrdersTotal() - 1;
      Gi_0009 = Gi_0008;
      if(Gi_0008 >= 0)
        {
         do
           {
            if(OrderSelect(Gi_0009, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
              {
               if(tmp_str0003 == "buy" && OrderType() == OP_BUY && OrderTicket() > Gi_0007)
                 {
                  Gd_0005 = OrderOpenPrice();
                  Gd_0006 = OrderLots();
                  Gi_0007 = OrderTicket();
                 }
               if(tmp_str0003 == "sell" && OrderType() == OP_SELL && OrderTicket() > Gi_0007)
                 {
                  Gd_0005 = OrderOpenPrice();
                  Gd_0006 = OrderLots();
                  Gi_0007 = OrderTicket();
                 }
              }
            Gi_0009 = Gi_0009 - 1;
           }
         while(Gi_0009 >= 0);
        }
      if(tmp_str0002 == "Price")
        {
         Gd_0008 = Gd_0005;
        }
      else
        {
         if(tmp_str0002 == "Lots")
           {
            Gd_0008 = Gd_0006;
           }
         else
           {
            Gd_0008 = 0;
           }
        }
      Gd_000A = (Bid - Gd_0008);
      if((Gd_000A < (Ld_FFF0 * _Point)))
         return Li_FFFC;
      if(Ii_00D4 >= Sellcount)
         return Li_FFFC;
      if(Ib_001C)
        {
         if((Ld_FFD8 >= Ld_FFE0))
           {
            Lb_FFEF = true;
            return Li_FFFC;
           }
         Lb_FFEF = false;
         return Li_FFFC;
        }
      Lb_FFEF = true;
     }
   Li_FFFC = Lb_FFEF;
   return Li_FFFC;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void func_1018()
  {
   string tmp_str0000;
   int Li_FFFC;
   long Ll_FFF0;
   long Ll_FFE8;
   double Ld_FFE0;
   int Li_FFDC;

   Li_FFFC = 0;
   if(OrdersTotal() > 0)
     {
      do
        {
         if(OrderSelect(Li_FFFC, 0, 0) && OrderSymbol() == _Symbol && Magic == OrderMagicNumber())
           {
            Id_0108 = NormalizeDouble(OrderOpenPrice(), _Digits);
            if(OrderType() == OP_BUYSTOP)
              {
               Ii_0110 = Ii_0110 + 1;
               if((Id_0120 < Id_0108) || (Id_0120 == 0))
                 {

                  Id_0120 = Id_0108;
                 }
               Ii_0118 = OrderTicket();
               Id_0140 = Id_0108;
              }
            if(OrderType() == OP_SELLSTOP)
              {
               Ii_0114 = Ii_0114 + 1;
               if((Id_0138 > Id_0108) || (Id_0138 == 0))
                 {

                  Id_0138 = Id_0108;
                 }
               Ii_011C = OrderTicket();
               Id_0148 = Id_0108;
              }
            if(OrderType() == OP_BUY)
              {
               Ii_00D0 = Ii_00D0 + 1;
               Id_00C0 = (Id_00C0 + OrderLots());
               Id_0158 = ((Id_0108 * OrderLots()) + Id_0158);
               if((Id_0120 < Id_0108) || (Id_0120 == 0))
                 {

                  Id_0120 = Id_0108;
                 }
               if((Id_0128 > Id_0108) || (Id_0128 == 0))
                 {

                  Id_0128 = Id_0108;
                 }
               if(Il_0180 < OrderOpenTime())
                 {
                  Id_0198 = Id_0108;
                  Il_0180 = OrderOpenTime();
                 }
               if((OrderLots() > Id_0170))
                 {
                  Id_0170 = OrderLots();
                 }
               Gd_0000 = OrderProfit();
               Gd_0000 = (Gd_0000 + OrderSwap());
               Id_00B0 = ((Gd_0000 + OrderCommission()) + Id_00B0);
              }
            if(OrderType() == OP_SELL)
              {
               Ii_00D4 = Ii_00D4 + 1;
               Id_00C8 = (Id_00C8 + OrderLots());
               Id_0150 = ((Id_0108 * OrderLots()) + Id_0150);
               if((Id_0138 > Id_0108) || (Id_0138 == 0))
                 {

                  Id_0138 = Id_0108;
                 }
               if((Id_0130 < Id_0108) || (Id_0130 == 0))
                 {

                  Id_0130 = Id_0108;
                 }
               if(Il_0188 < OrderOpenTime())
                 {
                  Id_0190 = Id_0108;
                  Il_0188 = OrderOpenTime();
                 }
               if((OrderLots() > Id_0178))
                 {
                  Id_0178 = OrderLots();
                 }
               Gd_0000 = OrderProfit();
               Gd_0000 = (Gd_0000 + OrderSwap());
               Id_00B8 = ((Gd_0000 + OrderCommission()) + Id_00B8);
              }
           }
         Li_FFFC = Li_FFFC + 1;
        }
      while(Li_FFFC < OrdersTotal());
     }
   Ll_FFF0 = 0;
   Ll_FFE8 = iTime(NULL, 1440, 0);
   Gl_0000 = TimeCurrent() + 1;
   Gi_0000 = TimeHour((Gl_0000 - TimeGMT()));
   Gl_0001 = TimeCurrent() + 1;
   Gi_0001 = TimeMinute((Gl_0001 - TimeGMT())) / 60;
   Gi_0001 = Gi_0000 + Gi_0001;
   Ld_FFE0 = Gi_0001;
   if((TimeHour(TimeCurrent()) < Ld_FFE0))
     {
      Gi_0001 = (int)(Ld_FFE0 * 3600);
      Gl_0001 = Gi_0001;
      Gl_0001 = Ll_FFE8 + Gl_0001;
      Ll_FFF0 = Gl_0001 - 86400;
     }
   else
     {
      Gi_0001 = (int)(Ld_FFE0 * 3600);
      Gl_0001 = Gi_0001;
      Ll_FFF0 = Ll_FFE8 + Gl_0001;
     }
   Li_FFDC = HistoryTotal() - 1;
   if(Li_FFDC >= 0)
     {
      do
        {
         if(OrderSelect(Li_FFDC, 0, 1) && OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
           {
            if(OrderType() == OP_BUY || OrderType() == OP_SELL)
              {

               Gd_0001 = (Id_01A0 + OrderProfit());
               Gd_0001 = (Gd_0001 + OrderCommission());
               Id_01A0 = (Gd_0001 + OrderSwap());
               Id_01A8 = (Id_01A8 + OrderLots());
               if((Id_01B0 < OrderLots()))
                 {
                  Id_01B0 = OrderLots();
                 }
               if(OrderCloseTime() >= Ll_FFF0)
                 {
                  if((OrderLots() > Id_0168))
                    {
                     Id_0168 = OrderLots();
                    }
                  Id_01C0 = (Id_01C0 + OrderLots());
                  Gd_0001 = (Id_01B8 + OrderProfit());
                  Gd_0001 = (Gd_0001 + OrderCommission());
                  Id_01B8 = (Gd_0001 + OrderSwap());
                 }
              }
           }
         Li_FFDC = Li_FFDC - 1;
        }
      while(Li_FFDC >= 0);
     }
   ObjectDelete("SLb");
   ObjectDelete("SLs");
   if(Ii_00D0 > 0)
     {
      Id_00F8 = NormalizeDouble((Id_0158 / Id_00C0), _Digits);
      Id_00F8 = ((点数b * _Point) + Id_0200);
      ObjectCreate(0, "SLb", OBJ_ARROW, 0, Time[0], Id_00F8, 0, 0, 0, 0);
      ObjectSet("SLb", OBJPROP_ARROWCODE, 6);
      ObjectSet("SLb", OBJPROP_COLOR, 16711680);
     }
   if(Ii_00D4 > 0)
     {
      Id_0100 = NormalizeDouble((Id_0150 / Id_00C8), _Digits);
      Gd_0002 = (点数s * _Point);
      Id_0100 = (Id_01F8 - Gd_0002);
      ObjectCreate(0, "SLs", OBJ_ARROW, 0, Time[0], Id_0100, 0, 0, 0, 0);
      ObjectSet("SLs", OBJPROP_ARROWCODE, 6);
      ObjectSet("SLs", OBJPROP_COLOR, 255);
     }
   tmp_str0000 = CharToString('J');
   ObjectSetText("Char.op", tmp_str0000, (Ii_0018 + 2), "Wingdings", 255);
   if(TimeHour(TimeGMT()) == 0)
     {
      if(TimeMinute(TimeGMT()) == 0 || TimeMinute(TimeGMT()) == 1 || TimeMinute(TimeGMT()) == 2)
        {

         Id_00A8 = 0;
         Id_0168 = 0;
        }
     }
   Gd_0003 = (Id_00B0 + Id_00B8);
   if((Id_00A0 > Gd_0003))
     {
      Id_00A0 = Gd_0003;
     }
   Gd_0004 = (Id_00B0 + Id_00B8);
   if((Id_00A8 > Gd_0004))
     {
      Id_00A8 = Gd_0004;
     }
   Gd_0005 = Id_00C0;
   if(Id_00C0 <= Id_00C8)
     {
      Gd_0006 = Id_00C8;
     }
   else
     {
      Gd_0006 = Gd_0005;
     }
   if((Gd_0006 > Id_0168))
     {
      Gd_0006 = Id_00C0;
      if(Id_00C0 <= Id_00C8)
        {
         Gd_0007 = Id_00C8;
        }
      else
        {
         Gd_0007 = Gd_0006;
        }
      Id_0168 = Gd_0007;
     }
   Gd_0007 = Id_00C0;
   if(Id_00C0 <= Id_00C8)
     {
      Gd_0008 = Id_00C8;
     }
   else
     {
      Gd_0008 = Gd_0007;
     }
   if((Gd_0008 > Id_01B0))
     {
      Gd_0008 = Id_00C0;
      if(Id_00C0 <= Id_00C8)
        {
         Gd_0009 = Id_00C8;
        }
      else
        {
         Gd_0009 = Gd_0008;
        }
      Id_01B0 = Gd_0009;
     }
   returned_double = MathMod(Hour(), 5);
   if((returned_double == 0))
     {
      returned_double = MathMod(Minute(), 20);
      if((returned_double == 0))
        {
         returned_double = MathMod(Seconds(), 10);
         if((returned_double == 0) && IsTesting())
           {
            Print("您的当前浮亏是：", NormalizeDouble((Id_00B0 + Id_00B8), 2));
           }
        }
     }
   returned_double = MathMod(Hour(), 5);
   if((returned_double != 0))
      return;
   returned_double = MathMod(Minute(), 59);
   if((returned_double != 0))
      return;
   returned_double = MathMod(Seconds(), 10);
   if((returned_double != 0))
      return;
   if(IsTesting())
      return;
   Print("您的最大浮亏是：", NormalizeDouble(Id_00A0, 2));

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void func_1019()
  {
   string tmp_str0000;
   string tmp_str0001;
   string tmp_str0002;
   string tmp_str0003;
   string tmp_str0004;
   string tmp_str0005;
   string tmp_str0006;
   string tmp_str0007;
   string tmp_str0008;
   string tmp_str0009;
   string tmp_str000A;
   string tmp_str000B;
   string tmp_str000C;
   string tmp_str000D;
   string tmp_str000E;
   string tmp_str000F;
   string tmp_str0010;
   string tmp_str0011;
   string tmp_str0012;
   string tmp_str0013;
   string tmp_str0014;
   string tmp_str0015;
   string tmp_str0016;
   string tmp_str0017;
   string tmp_str0018;
   string tmp_str0019;
   string tmp_str001A;
   string tmp_str001B;
   string tmp_str001C;
   string tmp_str001D;
   string tmp_str001E;
   string tmp_str001F;
   string tmp_str0020;
   string tmp_str0021;
   string tmp_str0022;
   string tmp_str0023;
   string tmp_str0024;
   string tmp_str0025;
   string tmp_str0026;
   string tmp_str0027;
   string tmp_str0028;
   string tmp_str0029;
   string tmp_str002A;
   string tmp_str002B;
   string tmp_str002C;
   string tmp_str002D;
   string tmp_str002E;
   string tmp_str002F;
   string tmp_str0030;
   string tmp_str0031;
   string tmp_str0032;
   string tmp_str0033;
   string tmp_str0034;
   string tmp_str0035;
   string tmp_str0036;
   string tmp_str0037;
   string tmp_str0038;
   string tmp_str0039;
   string tmp_str003A;
   string tmp_str003B;
   string tmp_str003C;
   string tmp_str003D;
   string tmp_str003E;
   string tmp_str003F;
   string tmp_str0040;
   string tmp_str0041;
   string tmp_str0042;
   string tmp_str0043;
   string tmp_str0044;
   string tmp_str0045;
   string tmp_str0046;
   string tmp_str0047;
   string tmp_str0048;
   string tmp_str0049;
   int Li_FFFC;
   int Li_FFF8;

   Li_FFFC = 0;
   Li_FFF8 = 240;
   Ii_0018 = 10;
   Gi_0000 = 10 * 3;
   Li_FFFC = Gi_0000 + 10;
   if(ObjectGetInteger(0, "操作按钮-", 1018, 0) != 0)
     {
      Ib_0208 = true;
      ObjectDelete(0, "操作按钮-");
      ObjectDelete(0, "账户杠杆");
      ObjectDelete(0, "强平比例");
      ObjectDelete(0, "今日手数");
      ObjectDelete(0, "总共手数");
      ObjectDelete(0, "今日最大");
      ObjectDelete(0, "历史最大");
      ObjectDelete(0, "今日浮亏");
      ObjectDelete(0, "最大浮亏");
      ObjectDelete(0, "今日利润");
      ObjectDelete(0, "总共利润");
      ObjectDelete(0, "买单数量");
      ObjectDelete(0, "卖单数量");
      ObjectDelete(0, "买单手数");
      ObjectDelete(0, "卖单手数");
      ObjectDelete(0, "买单利润");
      ObjectDelete(0, "卖单利润");
      ObjectDelete(0, "浮动盈亏");
      ObjectDelete(0, "点差");
      ObjectDelete(0, "面板背景颜色");
      ObjectDelete(0, "面板背景");
     }
   if(ObjectGetInteger(0, "操作按钮+", 1018, 0) != 0)
     {
      Ib_0208 = false;
      ObjectDelete(0, "操作按钮+");
     }
   if(Ib_0208 != true)
     {
      Gi_0000 = Li_FFF8 + 20;
      func_1024(0, Ib_0208, "操作按钮-", 0, Gi_0000, 30, 1, 20, 20, "-", "Arial", 12, 16777215, 3937500, false);
      Gi_0000 = 8421504;
      Gi_0001 = 8421504;
      Gi_0002 = 460;
      Gi_0003 = 320;
      tmp_str0000 = "面板背景";
      Gb_0006 = Ib_0208;
      Gl_0007 = 0;
      if(ObjectFind(0, tmp_str0000) == -1)
        {
         ObjectCreate(0, tmp_str0000, OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, tmp_str0000, 1029, 0);
         ObjectSetInteger(0, tmp_str0000, 101, 1);
         ObjectSetInteger(0, tmp_str0000, 7, 0);
         ObjectSetInteger(0, tmp_str0000, 8, 2);
         ObjectSetInteger(0, tmp_str0000, 9, 0);
         ObjectSetInteger(0, tmp_str0000, 1000, 0);
         ObjectSetInteger(0, tmp_str0000, 17, 0);
         ObjectSetInteger(0, tmp_str0000, 208, 1);
         ObjectSetInteger(0, tmp_str0000, 207, 0);
        }
      ObjectSetInteger(Gl_0007, tmp_str0000, 1025, Gi_0001);
      ObjectSetInteger(Gl_0007, tmp_str0000, 6, Gi_0000);
      ObjectSetInteger(Gl_0007, tmp_str0000, 1019, Gi_0003);
      ObjectSetInteger(Gl_0007, tmp_str0000, 1020, Gi_0002);
      ObjectSetInteger(Gl_0007, tmp_str0000, 102, Li_FFF8);
      ObjectSetInteger(Gl_0007, tmp_str0000, 103, 30);
      if(Gb_0006)
        {
         ObjectSetInteger(Gl_0007, tmp_str0000, 15, -1);
        }
      Gi_0008 = 0;
      Gi_0009 = 15134970;
      Gi_000A = 460;
      Gi_000B = 400;
      tmp_str0001 = "面板背景颜色";
      Gb_000E = Ib_0208;
      Gl_000F = 0;
      if(ObjectFind(0, tmp_str0001) == -1)
        {
         ObjectCreate(0, tmp_str0001, OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, tmp_str0001, 1029, 0);
         ObjectSetInteger(0, tmp_str0001, 101, 1);
         ObjectSetInteger(0, tmp_str0001, 7, 0);
         ObjectSetInteger(0, tmp_str0001, 8, 0);
         ObjectSetInteger(0, tmp_str0001, 9, 0);
         ObjectSetInteger(0, tmp_str0001, 1000, 0);
         ObjectSetInteger(0, tmp_str0001, 17, 0);
         ObjectSetInteger(0, tmp_str0001, 208, 1);
         ObjectSetInteger(0, tmp_str0001, 207, 0);
        }
      ObjectSetInteger(Gl_000F, tmp_str0001, 1025, Gi_0009);
      ObjectSetInteger(Gl_000F, tmp_str0001, 6, Gi_0008);
      ObjectSetInteger(Gl_000F, tmp_str0001, 1019, Gi_000B);
      ObjectSetInteger(Gl_000F, tmp_str0001, 1020, Gi_000A);
      ObjectSetInteger(Gl_000F, tmp_str0001, 102, Li_FFF8);
      ObjectSetInteger(Gl_000F, tmp_str0001, 103, 30);
      if(Gb_000E)
        {
         ObjectSetInteger(Gl_000F, tmp_str0001, 15, -1);
        }
      Gi_0010 = 16711680;
      tmp_str0002 = "Arial";
      tmp_str0003 = DoubleToString(AccountLeverage(), 0);
      tmp_str0004 = StringConcatenate("账户杠杆: ", tmp_str0003);
      Gi_0011 = Li_FFFC - 10;
      tmp_str0005 = "账户杠杆";
      Gb_0013 = Ib_0208;
      Gl_0014 = 0;
      if(ObjectFind(0, tmp_str0005) == -1)
        {
         if(ObjectCreate(0, tmp_str0005, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0005, 101, 1);
            ObjectSetString(0, tmp_str0005, 1001, tmp_str0002);
            ObjectSetInteger(0, tmp_str0005, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0005, 13, 0);
            ObjectSetInteger(0, tmp_str0005, 1011, 0);
            ObjectSetInteger(0, tmp_str0005, 9, 0);
            ObjectSetInteger(0, tmp_str0005, 1000, 0);
            ObjectSetInteger(0, tmp_str0005, 17, 0);
            ObjectSetInteger(0, tmp_str0005, 208, 0);
            ObjectSetInteger(0, tmp_str0005, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0014, tmp_str0005, 6, Gi_0010);
      ObjectSetInteger(Gl_0014, tmp_str0005, 102, Li_FFF8);
      ObjectSetInteger(Gl_0014, tmp_str0005, 103, Gi_0011);
      ObjectSetString(Gl_0014, tmp_str0005, 999, tmp_str0004);
      if(Gb_0013)
        {
         ObjectSetInteger(Gl_0014, tmp_str0005, 15, -1);
        }
      Gi_0015 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0015;
      Gi_0015 = 16711680;
      tmp_str0006 = "Arial";
      tmp_str0007 = DoubleToString(AccountStopoutLevel(), 0);
      tmp_str0008 = StringConcatenate("强平比例: ", tmp_str0007, "%");
      Gi_0016 = Li_FFFC - 5;
      tmp_str0009 = "强平比例";
      Gb_0018 = Ib_0208;
      Gl_0019 = 0;
      if(ObjectFind(0, tmp_str0009) == -1)
        {
         if(ObjectCreate(0, tmp_str0009, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0009, 101, 1);
            ObjectSetString(0, tmp_str0009, 1001, tmp_str0006);
            ObjectSetInteger(0, tmp_str0009, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0009, 13, 0);
            ObjectSetInteger(0, tmp_str0009, 1011, 0);
            ObjectSetInteger(0, tmp_str0009, 9, 0);
            ObjectSetInteger(0, tmp_str0009, 1000, 0);
            ObjectSetInteger(0, tmp_str0009, 17, 0);
            ObjectSetInteger(0, tmp_str0009, 208, 0);
            ObjectSetInteger(0, tmp_str0009, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0019, tmp_str0009, 6, Gi_0015);
      ObjectSetInteger(Gl_0019, tmp_str0009, 102, Li_FFF8);
      ObjectSetInteger(Gl_0019, tmp_str0009, 103, Gi_0016);
      ObjectSetString(Gl_0019, tmp_str0009, 999, tmp_str0008);
      if(Gb_0018)
        {
         ObjectSetInteger(Gl_0019, tmp_str0009, 15, -1);
        }
      Gi_001A = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_001A;
      Gi_001A = Ii_0014;
      tmp_str000A = "Arial";
      tmp_str000B = DoubleToString(Id_01C0, 2);
      tmp_str000C = StringConcatenate("今日手数: ", tmp_str000B);
      tmp_str000D = "今日手数";
      Gb_001D = Ib_0208;
      Gl_001E = 0;
      if(ObjectFind(0, tmp_str000D) == -1)
        {
         if(ObjectCreate(0, tmp_str000D, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str000D, 101, 1);
            ObjectSetString(0, tmp_str000D, 1001, tmp_str000A);
            ObjectSetInteger(0, tmp_str000D, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str000D, 13, 0);
            ObjectSetInteger(0, tmp_str000D, 1011, 0);
            ObjectSetInteger(0, tmp_str000D, 9, 0);
            ObjectSetInteger(0, tmp_str000D, 1000, 0);
            ObjectSetInteger(0, tmp_str000D, 17, 0);
            ObjectSetInteger(0, tmp_str000D, 208, 0);
            ObjectSetInteger(0, tmp_str000D, 207, 0);
           }
        }
      ObjectSetInteger(Gl_001E, tmp_str000D, 6, Gi_001A);
      ObjectSetInteger(Gl_001E, tmp_str000D, 102, Li_FFF8);
      ObjectSetInteger(Gl_001E, tmp_str000D, 103, Li_FFFC);
      ObjectSetString(Gl_001E, tmp_str000D, 999, tmp_str000C);
      if(Gb_001D)
        {
         ObjectSetInteger(Gl_001E, tmp_str000D, 15, -1);
        }
      Gi_001F = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_001F;
      Gi_001F = Ii_0014;
      tmp_str000E = "Arial";
      tmp_str000F = DoubleToString(Id_01A8, 2);
      tmp_str0010 = StringConcatenate("总共手数: ", tmp_str000F);
      Gi_0020 = Li_FFFC + 5;
      tmp_str0011 = "总共手数";
      Gb_0022 = Ib_0208;
      Gl_0023 = 0;
      if(ObjectFind(0, tmp_str0011) == -1)
        {
         if(ObjectCreate(0, tmp_str0011, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0011, 101, 1);
            ObjectSetString(0, tmp_str0011, 1001, tmp_str000E);
            ObjectSetInteger(0, tmp_str0011, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0011, 13, 0);
            ObjectSetInteger(0, tmp_str0011, 1011, 0);
            ObjectSetInteger(0, tmp_str0011, 9, 0);
            ObjectSetInteger(0, tmp_str0011, 1000, 0);
            ObjectSetInteger(0, tmp_str0011, 17, 0);
            ObjectSetInteger(0, tmp_str0011, 208, 0);
            ObjectSetInteger(0, tmp_str0011, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0023, tmp_str0011, 6, Gi_001F);
      ObjectSetInteger(Gl_0023, tmp_str0011, 102, Li_FFF8);
      ObjectSetInteger(Gl_0023, tmp_str0011, 103, Gi_0020);
      ObjectSetString(Gl_0023, tmp_str0011, 999, tmp_str0010);
      if(Gb_0022)
        {
         ObjectSetInteger(Gl_0023, tmp_str0011, 15, -1);
        }
      Gi_0024 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0024;
      Gi_0024 = 16711680;
      tmp_str0012 = "Arial";
      tmp_str0013 = DoubleToString(Id_0168, 2);
      tmp_str0014 = StringConcatenate("今日最大: ", tmp_str0013);
      Gi_0025 = Li_FFFC + 10;
      tmp_str0015 = "今日最大";
      Gb_0027 = Ib_0208;
      Gl_0028 = 0;
      if(ObjectFind(0, tmp_str0015) == -1)
        {
         if(ObjectCreate(0, tmp_str0015, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0015, 101, 1);
            ObjectSetString(0, tmp_str0015, 1001, tmp_str0012);
            ObjectSetInteger(0, tmp_str0015, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0015, 13, 0);
            ObjectSetInteger(0, tmp_str0015, 1011, 0);
            ObjectSetInteger(0, tmp_str0015, 9, 0);
            ObjectSetInteger(0, tmp_str0015, 1000, 0);
            ObjectSetInteger(0, tmp_str0015, 17, 0);
            ObjectSetInteger(0, tmp_str0015, 208, 0);
            ObjectSetInteger(0, tmp_str0015, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0028, tmp_str0015, 6, Gi_0024);
      ObjectSetInteger(Gl_0028, tmp_str0015, 102, Li_FFF8);
      ObjectSetInteger(Gl_0028, tmp_str0015, 103, Gi_0025);
      ObjectSetString(Gl_0028, tmp_str0015, 999, tmp_str0014);
      if(Gb_0027)
        {
         ObjectSetInteger(Gl_0028, tmp_str0015, 15, -1);
        }
      Gi_0029 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0029;
      Gi_0029 = 16711680;
      tmp_str0016 = "Arial";
      tmp_str0017 = DoubleToString(Id_01B0, 2);
      tmp_str0018 = StringConcatenate("历史最大: ", tmp_str0017);
      Gi_002A = Li_FFFC + 15;
      tmp_str0019 = "历史最大";
      Gb_002C = Ib_0208;
      Gl_002D = 0;
      if(ObjectFind(0, tmp_str0019) == -1)
        {
         if(ObjectCreate(0, tmp_str0019, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0019, 101, 1);
            ObjectSetString(0, tmp_str0019, 1001, tmp_str0016);
            ObjectSetInteger(0, tmp_str0019, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0019, 13, 0);
            ObjectSetInteger(0, tmp_str0019, 1011, 0);
            ObjectSetInteger(0, tmp_str0019, 9, 0);
            ObjectSetInteger(0, tmp_str0019, 1000, 0);
            ObjectSetInteger(0, tmp_str0019, 17, 0);
            ObjectSetInteger(0, tmp_str0019, 208, 0);
            ObjectSetInteger(0, tmp_str0019, 207, 0);
           }
        }
      ObjectSetInteger(Gl_002D, tmp_str0019, 6, Gi_0029);
      ObjectSetInteger(Gl_002D, tmp_str0019, 102, Li_FFF8);
      ObjectSetInteger(Gl_002D, tmp_str0019, 103, Gi_002A);
      ObjectSetString(Gl_002D, tmp_str0019, 999, tmp_str0018);
      if(Gb_002C)
        {
         ObjectSetInteger(Gl_002D, tmp_str0019, 15, -1);
        }
      Gi_002E = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_002E;
      Gi_002E = Ii_0014;
      tmp_str001A = "Arial";
      tmp_str001B = DoubleToString(Id_00A8, 2);
      tmp_str001C = StringConcatenate("今日浮亏: ", tmp_str001B);
      Gi_002F = Li_FFFC + 20;
      tmp_str001D = "今日浮亏";
      Gb_0031 = Ib_0208;
      Gl_0032 = 0;
      if(ObjectFind(0, tmp_str001D) == -1)
        {
         if(ObjectCreate(0, tmp_str001D, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str001D, 101, 1);
            ObjectSetString(0, tmp_str001D, 1001, tmp_str001A);
            ObjectSetInteger(0, tmp_str001D, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str001D, 13, 0);
            ObjectSetInteger(0, tmp_str001D, 1011, 0);
            ObjectSetInteger(0, tmp_str001D, 9, 0);
            ObjectSetInteger(0, tmp_str001D, 1000, 0);
            ObjectSetInteger(0, tmp_str001D, 17, 0);
            ObjectSetInteger(0, tmp_str001D, 208, 0);
            ObjectSetInteger(0, tmp_str001D, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0032, tmp_str001D, 6, Gi_002E);
      ObjectSetInteger(Gl_0032, tmp_str001D, 102, Li_FFF8);
      ObjectSetInteger(Gl_0032, tmp_str001D, 103, Gi_002F);
      ObjectSetString(Gl_0032, tmp_str001D, 999, tmp_str001C);
      if(Gb_0031)
        {
         ObjectSetInteger(Gl_0032, tmp_str001D, 15, -1);
        }
      Gi_0033 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0033;
      Gi_0033 = Ii_0014;
      tmp_str001E = "Arial";
      tmp_str001F = DoubleToString(Id_00A0, 2);
      tmp_str0020 = StringConcatenate("最大浮亏: ", tmp_str001F);
      Gi_0034 = Li_FFFC + 25;
      tmp_str0021 = "最大浮亏";
      Gb_0036 = Ib_0208;
      Gl_0037 = 0;
      if(ObjectFind(0, tmp_str0021) == -1)
        {
         if(ObjectCreate(0, tmp_str0021, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0021, 101, 1);
            ObjectSetString(0, tmp_str0021, 1001, tmp_str001E);
            ObjectSetInteger(0, tmp_str0021, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0021, 13, 0);
            ObjectSetInteger(0, tmp_str0021, 1011, 0);
            ObjectSetInteger(0, tmp_str0021, 9, 0);
            ObjectSetInteger(0, tmp_str0021, 1000, 0);
            ObjectSetInteger(0, tmp_str0021, 17, 0);
            ObjectSetInteger(0, tmp_str0021, 208, 0);
            ObjectSetInteger(0, tmp_str0021, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0037, tmp_str0021, 6, Gi_0033);
      ObjectSetInteger(Gl_0037, tmp_str0021, 102, Li_FFF8);
      ObjectSetInteger(Gl_0037, tmp_str0021, 103, Gi_0034);
      ObjectSetString(Gl_0037, tmp_str0021, 999, tmp_str0020);
      if(Gb_0036)
        {
         ObjectSetInteger(Gl_0037, tmp_str0021, 15, -1);
        }
      Gi_0038 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0038;
      Gi_0038 = 16711680;
      tmp_str0022 = "Arial";
      tmp_str0023 = DoubleToString(Id_01B8, 2);
      tmp_str0024 = StringConcatenate("今日利润: ", tmp_str0023);
      Gi_0039 = Li_FFFC + 30;
      tmp_str0025 = "今日利润";
      Gb_003B = Ib_0208;
      Gl_003C = 0;
      if(ObjectFind(0, tmp_str0025) == -1)
        {
         if(ObjectCreate(0, tmp_str0025, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0025, 101, 1);
            ObjectSetString(0, tmp_str0025, 1001, tmp_str0022);
            ObjectSetInteger(0, tmp_str0025, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0025, 13, 0);
            ObjectSetInteger(0, tmp_str0025, 1011, 0);
            ObjectSetInteger(0, tmp_str0025, 9, 0);
            ObjectSetInteger(0, tmp_str0025, 1000, 0);
            ObjectSetInteger(0, tmp_str0025, 17, 0);
            ObjectSetInteger(0, tmp_str0025, 208, 0);
            ObjectSetInteger(0, tmp_str0025, 207, 0);
           }
        }
      ObjectSetInteger(Gl_003C, tmp_str0025, 6, Gi_0038);
      ObjectSetInteger(Gl_003C, tmp_str0025, 102, Li_FFF8);
      ObjectSetInteger(Gl_003C, tmp_str0025, 103, Gi_0039);
      ObjectSetString(Gl_003C, tmp_str0025, 999, tmp_str0024);
      if(Gb_003B)
        {
         ObjectSetInteger(Gl_003C, tmp_str0025, 15, -1);
        }
      Gi_003D = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_003D;
      Gi_003D = 16711680;
      tmp_str0026 = "Arial";
      tmp_str0027 = DoubleToString(Id_01A0, 2);
      tmp_str0028 = StringConcatenate("总共利润: ", tmp_str0027);
      Gi_003E = Li_FFFC + 35;
      tmp_str0029 = "总共利润";
      Gb_0040 = Ib_0208;
      Gl_0041 = 0;
      if(ObjectFind(0, tmp_str0029) == -1)
        {
         if(ObjectCreate(0, tmp_str0029, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0029, 101, 1);
            ObjectSetString(0, tmp_str0029, 1001, tmp_str0026);
            ObjectSetInteger(0, tmp_str0029, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0029, 13, 0);
            ObjectSetInteger(0, tmp_str0029, 1011, 0);
            ObjectSetInteger(0, tmp_str0029, 9, 0);
            ObjectSetInteger(0, tmp_str0029, 1000, 0);
            ObjectSetInteger(0, tmp_str0029, 17, 0);
            ObjectSetInteger(0, tmp_str0029, 208, 0);
            ObjectSetInteger(0, tmp_str0029, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0041, tmp_str0029, 6, Gi_003D);
      ObjectSetInteger(Gl_0041, tmp_str0029, 102, Li_FFF8);
      ObjectSetInteger(Gl_0041, tmp_str0029, 103, Gi_003E);
      ObjectSetString(Gl_0041, tmp_str0029, 999, tmp_str0028);
      if(Gb_0040)
        {
         ObjectSetInteger(Gl_0041, tmp_str0029, 15, -1);
        }
      Gi_0042 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0042;
      Gi_0042 = Ii_0014;
      tmp_str002A = "Arial";
      tmp_str002B = IntegerToString(Ii_00D0, 0, 32);
      tmp_str002C = StringConcatenate("买单数量: ", tmp_str002B);
      Gi_0043 = Li_FFFC + 40;
      tmp_str002D = "买单数量";
      Gb_0045 = Ib_0208;
      Gl_0046 = 0;
      if(ObjectFind(0, tmp_str002D) == -1)
        {
         if(ObjectCreate(0, tmp_str002D, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str002D, 101, 1);
            ObjectSetString(0, tmp_str002D, 1001, tmp_str002A);
            ObjectSetInteger(0, tmp_str002D, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str002D, 13, 0);
            ObjectSetInteger(0, tmp_str002D, 1011, 0);
            ObjectSetInteger(0, tmp_str002D, 9, 0);
            ObjectSetInteger(0, tmp_str002D, 1000, 0);
            ObjectSetInteger(0, tmp_str002D, 17, 0);
            ObjectSetInteger(0, tmp_str002D, 208, 0);
            ObjectSetInteger(0, tmp_str002D, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0046, tmp_str002D, 6, Gi_0042);
      ObjectSetInteger(Gl_0046, tmp_str002D, 102, Li_FFF8);
      ObjectSetInteger(Gl_0046, tmp_str002D, 103, Gi_0043);
      ObjectSetString(Gl_0046, tmp_str002D, 999, tmp_str002C);
      if(Gb_0045)
        {
         ObjectSetInteger(Gl_0046, tmp_str002D, 15, -1);
        }
      Gi_0047 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0047;
      Gi_0047 = Ii_0014;
      tmp_str002E = "Arial";
      tmp_str002F = IntegerToString(Ii_00D4, 0, 32);
      tmp_str0030 = StringConcatenate("卖单数量: ", tmp_str002F);
      Gi_0048 = Li_FFFC + 45;
      tmp_str0031 = "卖单数量";
      Gb_004A = Ib_0208;
      Gl_004B = 0;
      if(ObjectFind(0, tmp_str0031) == -1)
        {
         if(ObjectCreate(0, tmp_str0031, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0031, 101, 1);
            ObjectSetString(0, tmp_str0031, 1001, tmp_str002E);
            ObjectSetInteger(0, tmp_str0031, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0031, 13, 0);
            ObjectSetInteger(0, tmp_str0031, 1011, 0);
            ObjectSetInteger(0, tmp_str0031, 9, 0);
            ObjectSetInteger(0, tmp_str0031, 1000, 0);
            ObjectSetInteger(0, tmp_str0031, 17, 0);
            ObjectSetInteger(0, tmp_str0031, 208, 0);
            ObjectSetInteger(0, tmp_str0031, 207, 0);
           }
        }
      ObjectSetInteger(Gl_004B, tmp_str0031, 6, Gi_0047);
      ObjectSetInteger(Gl_004B, tmp_str0031, 102, Li_FFF8);
      ObjectSetInteger(Gl_004B, tmp_str0031, 103, Gi_0048);
      ObjectSetString(Gl_004B, tmp_str0031, 999, tmp_str0030);
      if(Gb_004A)
        {
         ObjectSetInteger(Gl_004B, tmp_str0031, 15, -1);
        }
      Gi_004C = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_004C;
      Gi_004C = 16711680;
      tmp_str0032 = "Arial";
      tmp_str0033 = DoubleToString(Id_00C0, 2);
      tmp_str0034 = StringConcatenate("买单手数: ", tmp_str0033);
      Gi_004D = Li_FFFC + 50;
      tmp_str0035 = "买单手数";
      Gb_004F = Ib_0208;
      Gl_0050 = 0;
      if(ObjectFind(0, tmp_str0035) == -1)
        {
         if(ObjectCreate(0, tmp_str0035, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0035, 101, 1);
            ObjectSetString(0, tmp_str0035, 1001, tmp_str0032);
            ObjectSetInteger(0, tmp_str0035, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0035, 13, 0);
            ObjectSetInteger(0, tmp_str0035, 1011, 0);
            ObjectSetInteger(0, tmp_str0035, 9, 0);
            ObjectSetInteger(0, tmp_str0035, 1000, 0);
            ObjectSetInteger(0, tmp_str0035, 17, 0);
            ObjectSetInteger(0, tmp_str0035, 208, 0);
            ObjectSetInteger(0, tmp_str0035, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0050, tmp_str0035, 6, Gi_004C);
      ObjectSetInteger(Gl_0050, tmp_str0035, 102, Li_FFF8);
      ObjectSetInteger(Gl_0050, tmp_str0035, 103, Gi_004D);
      ObjectSetString(Gl_0050, tmp_str0035, 999, tmp_str0034);
      if(Gb_004F)
        {
         ObjectSetInteger(Gl_0050, tmp_str0035, 15, -1);
        }
      Gi_0051 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0051;
      Gi_0051 = 16711680;
      tmp_str0036 = "Arial";
      tmp_str0037 = DoubleToString(Id_00C8, 2);
      tmp_str0038 = StringConcatenate("卖单手数: ", tmp_str0037);
      Gi_0052 = Li_FFFC + 55;
      tmp_str0039 = "卖单手数";
      Gb_0054 = Ib_0208;
      Gl_0055 = 0;
      if(ObjectFind(0, tmp_str0039) == -1)
        {
         if(ObjectCreate(0, tmp_str0039, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0039, 101, 1);
            ObjectSetString(0, tmp_str0039, 1001, tmp_str0036);
            ObjectSetInteger(0, tmp_str0039, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0039, 13, 0);
            ObjectSetInteger(0, tmp_str0039, 1011, 0);
            ObjectSetInteger(0, tmp_str0039, 9, 0);
            ObjectSetInteger(0, tmp_str0039, 1000, 0);
            ObjectSetInteger(0, tmp_str0039, 17, 0);
            ObjectSetInteger(0, tmp_str0039, 208, 0);
            ObjectSetInteger(0, tmp_str0039, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0055, tmp_str0039, 6, Gi_0051);
      ObjectSetInteger(Gl_0055, tmp_str0039, 102, Li_FFF8);
      ObjectSetInteger(Gl_0055, tmp_str0039, 103, Gi_0052);
      ObjectSetString(Gl_0055, tmp_str0039, 999, tmp_str0038);
      if(Gb_0054)
        {
         ObjectSetInteger(Gl_0055, tmp_str0039, 15, -1);
        }
      Gi_0056 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0056;
      Gi_0056 = Ii_0014;
      tmp_str003A = "Arial";
      tmp_str003B = DoubleToString(Id_00B0, 2);
      tmp_str003C = StringConcatenate("买单利润: ", tmp_str003B);
      Gi_0057 = Li_FFFC + 60;
      tmp_str003D = "买单利润";
      Gb_0059 = Ib_0208;
      Gl_005A = 0;
      if(ObjectFind(0, tmp_str003D) == -1)
        {
         if(ObjectCreate(0, tmp_str003D, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str003D, 101, 1);
            ObjectSetString(0, tmp_str003D, 1001, tmp_str003A);
            ObjectSetInteger(0, tmp_str003D, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str003D, 13, 0);
            ObjectSetInteger(0, tmp_str003D, 1011, 0);
            ObjectSetInteger(0, tmp_str003D, 9, 0);
            ObjectSetInteger(0, tmp_str003D, 1000, 0);
            ObjectSetInteger(0, tmp_str003D, 17, 0);
            ObjectSetInteger(0, tmp_str003D, 208, 0);
            ObjectSetInteger(0, tmp_str003D, 207, 0);
           }
        }
      ObjectSetInteger(Gl_005A, tmp_str003D, 6, Gi_0056);
      ObjectSetInteger(Gl_005A, tmp_str003D, 102, Li_FFF8);
      ObjectSetInteger(Gl_005A, tmp_str003D, 103, Gi_0057);
      ObjectSetString(Gl_005A, tmp_str003D, 999, tmp_str003C);
      if(Gb_0059)
        {
         ObjectSetInteger(Gl_005A, tmp_str003D, 15, -1);
        }
      Gi_005B = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_005B;
      Gi_005B = Ii_0014;
      tmp_str003E = "Arial";
      tmp_str003F = DoubleToString(Id_00B8, 2);
      tmp_str0040 = StringConcatenate("卖单利润: ", tmp_str003F);
      Gi_005C = Li_FFFC + 65;
      tmp_str0041 = "卖单利润";
      Gb_005E = Ib_0208;
      Gl_005F = 0;
      if(ObjectFind(0, tmp_str0041) == -1)
        {
         if(ObjectCreate(0, tmp_str0041, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0041, 101, 1);
            ObjectSetString(0, tmp_str0041, 1001, tmp_str003E);
            ObjectSetInteger(0, tmp_str0041, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0041, 13, 0);
            ObjectSetInteger(0, tmp_str0041, 1011, 0);
            ObjectSetInteger(0, tmp_str0041, 9, 0);
            ObjectSetInteger(0, tmp_str0041, 1000, 0);
            ObjectSetInteger(0, tmp_str0041, 17, 0);
            ObjectSetInteger(0, tmp_str0041, 208, 0);
            ObjectSetInteger(0, tmp_str0041, 207, 0);
           }
        }
      ObjectSetInteger(Gl_005F, tmp_str0041, 6, Gi_005B);
      ObjectSetInteger(Gl_005F, tmp_str0041, 102, Li_FFF8);
      ObjectSetInteger(Gl_005F, tmp_str0041, 103, Gi_005C);
      ObjectSetString(Gl_005F, tmp_str0041, 999, tmp_str0040);
      if(Gb_005E)
        {
         ObjectSetInteger(Gl_005F, tmp_str0041, 15, -1);
        }
      Gi_0060 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0060;
      Gi_0060 = 16711680;
      tmp_str0042 = "Arial";
      tmp_str0043 = DoubleToString((Id_00B0 + Id_00B8), 2);
      tmp_str0044 = StringConcatenate("浮动盈亏: ", tmp_str0043);
      Gi_0061 = Li_FFFC + 70;
      tmp_str0045 = "浮动盈亏";
      Gb_0063 = Ib_0208;
      Gl_0064 = 0;
      if(ObjectFind(0, tmp_str0045) == -1)
        {
         if(ObjectCreate(0, tmp_str0045, OBJ_LABEL, 0, 0, 0))
           {
            ObjectSetInteger(0, tmp_str0045, 101, 1);
            ObjectSetString(0, tmp_str0045, 1001, tmp_str0042);
            ObjectSetInteger(0, tmp_str0045, 100, Ii_0018);
            ObjectSetDouble(0, tmp_str0045, 13, 0);
            ObjectSetInteger(0, tmp_str0045, 1011, 0);
            ObjectSetInteger(0, tmp_str0045, 9, 0);
            ObjectSetInteger(0, tmp_str0045, 1000, 0);
            ObjectSetInteger(0, tmp_str0045, 17, 0);
            ObjectSetInteger(0, tmp_str0045, 208, 0);
            ObjectSetInteger(0, tmp_str0045, 207, 0);
           }
        }
      ObjectSetInteger(Gl_0064, tmp_str0045, 6, Gi_0060);
      ObjectSetInteger(Gl_0064, tmp_str0045, 102, Li_FFF8);
      ObjectSetInteger(Gl_0064, tmp_str0045, 103, Gi_0061);
      ObjectSetString(Gl_0064, tmp_str0045, 999, tmp_str0044);
      if(Gb_0063)
        {
         ObjectSetInteger(Gl_0064, tmp_str0045, 15, -1);
        }
      Gi_0065 = Ii_0018 * 2;
      Li_FFFC = Li_FFFC + Gi_0065;
      Gi_0065 = 255;
      tmp_str0046 = "Arial";
      tmp_str0047 = _Symbol + "：";
      tmp_str0047 = tmp_str0047 + DoubleToString(MarketInfo(_Symbol, MODE_SPREAD), 0);
      tmp_str0048 = StringConcatenate(tmp_str0047);
      Gi_0066 = Li_FFFC + 75;
      tmp_str0049 = "点差";
      Gb_0068 = Ib_0208;
      Gl_0069 = 0;
      if(ObjectFind(0, tmp_str0049) == -1)
        {
         if(ObjectCreate(0, tmp_str0049, OBJ_LABEL, 0, 0, 0))

            ObjectSetInteger(0, tmp_str0049, 101, 1);
         ObjectSetString(0, tmp_str0049, 1001, tmp_str0046);
         ObjectSetInteger(0, tmp_str0049, 100, Ii_0018);
         ObjectSetDouble(0, tmp_str0049, 13, 0);
         ObjectSetInteger(0, tmp_str0049, 1011, 0);
         ObjectSetInteger(0, tmp_str0049, 9, 0);
         ObjectSetInteger(0, tmp_str0049, 1000, 0);
         ObjectSetInteger(0, tmp_str0049, 17, 0);
         ObjectSetInteger(0, tmp_str0049, 208, 0);
         ObjectSetInteger(0, tmp_str0049, 207, 0);
        }
      ObjectSetInteger(Gl_0069, tmp_str0049, 6, Gi_0065);
      ObjectSetInteger(Gl_0069, tmp_str0049, 102, Li_FFF8);
      ObjectSetInteger(Gl_0069, tmp_str0049, 103, Gi_0066);
      ObjectSetString(Gl_0069, tmp_str0049, 999, tmp_str0048);
      ObjectSet(tmp_str0049, 101, 1);
      ObjectSet(tmp_str0049,OBJPROP_XDISTANCE, 156);
      ObjectSet(tmp_str0049,OBJPROP_YDISTANCE, 455);
      ObjectSetInteger(0,tmp_str0049,OBJPROP_SELECTABLE,0);

      if(Gb_0068 == false)
         return;
      ObjectSetInteger(Gl_0069, tmp_str0049, 15, -1);
      return ;
     }
   Gi_006A = Li_FFF8 + 20;
   func_1024(0, false, "操作按钮+", 0, Gi_006A, 30, 1, 20, 20, "+", "Arial", 12, 16777215, 3937500, false);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool func_1024(long Fa_l_00, bool FuncArg_Boolean_00000001, string Fa_s_02, int Fa_i_03, long Fa_l_04, long Fa_l_05, int Fa_i_06, int Fa_i_07, int Fa_i_08, string Fa_s_09, string Fa_s_0A, int Fa_i_0B, int Fa_i_0C, int Fa_i_0D, bool FuncArg_Boolean_0000000E)
  {
   bool Lb_FFFF;

   if(ObjectFind(Fa_l_00, Fa_s_02) == -1)
     {
      ObjectCreate(Fa_l_00, Fa_s_02, OBJ_BUTTON, Fa_i_03, 0, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 1019, Fa_i_07);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 1020, Fa_i_08);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 101, Fa_i_06);
      ObjectSetString(Fa_l_00, Fa_s_02, 1001, Fa_s_0A);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 100, Fa_i_0B);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 9, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 1000, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 17, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 208, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 207, 0);
      ObjectSetInteger(Fa_l_00, Fa_s_02, 1018, FuncArg_Boolean_0000000E);
     }
   ObjectSetInteger(Fa_l_00, Fa_s_02, 1025, Fa_i_0D);
   ObjectSetInteger(Fa_l_00, Fa_s_02, 6, Fa_i_0C);
   ObjectSetString(Fa_l_00, Fa_s_02, 999, Fa_s_09);
   ObjectSetInteger(Fa_l_00, Fa_s_02, 102, Fa_l_04);
   ObjectSetInteger(Fa_l_00, Fa_s_02, 103, Fa_l_05);
   if(FuncArg_Boolean_00000001 == false)
      return true;
   ObjectSetInteger(Fa_l_00, Fa_s_02, 15, -1);

   Lb_FFFF = true;
   return true;
  }


//+------------------------------------------------------------------+
