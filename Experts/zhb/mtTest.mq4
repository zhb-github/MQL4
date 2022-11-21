#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <Trader.mqh>
#include <CommonService.mqh>
//+------------------------------------------------------------------+
//| 马丁策略                 |
//+------------------------------------------------------------------+

// 最大级别
input int maxLevel = 12;
// 最大亏损
input double maxLoss = -1000;


input int period = 240;

input int profitParamter = 89;

input double spacing = 0.0070;




CTrader ctrader(1009);

int OnInit() {

	printf(" buyFlag currentLots =%g", ctrader.buyLot);
	printf(" buyFlag currentLots =%g", ctrader.sellLot);


	return 0;
}

void OnTick() {
//	ExpertRemove();

	bool buyFlag = ctrader.selectLastBuyOrder();

	//如果有买单
	if(buyFlag){

		// 判断当前是否盈利
		double buyProfit = ctrader.buyProfit();

		if(buyProfit >= getProfitTarget(ctrader.buyCount)){
			ctrader.closeBuy();
		}

		// 是否到达加仓间距
		if(ctrader.buyCount < maxLevel){
			ctrader.selectLastBuyOrder();
			// 订单价格 大于市价， 下跌

			if((OrderOpenPrice() - ctrader.bid()) >= getSpacing()){
				ctrader.buy(getLots(ctrader.buyCount + 1));
			}
		}
		// 是否达到亏损上限
		if(ctrader.buyCount >= maxLevel){
			if(buyProfit < maxLoss){
				ctrader.closeBuy();
			}
		}


	}else{
		ctrader.buy(getLots(1));
	}

	bool sellFlag = ctrader.selectLastSellOrder();

	//如果有买单
	if(sellFlag){

		// 判断当前是否盈利
		double sellProfit = ctrader.sellProfit();

		if(sellProfit >= getProfitTarget(ctrader.sellCount)){
			ctrader.closeSell();
		}

		// 是否到达加仓间距
		if(ctrader.sellCount < maxLevel){
			ctrader.selectLastSellOrder();
			//

			if((ctrader.ask() - OrderOpenPrice()) > getSpacing()){
				ctrader.sell(getLots(ctrader.sellCount+1));
			}
		}
		// 是否达到亏损上限
		if(ctrader.sellCount >= maxLevel){
			if(sellProfit < maxLoss){
				ctrader.closeSell();
			}
		}

	}else{
		ctrader.sell(getLots(1));
	}

}


// 获取下单量
double getLots(int level) {

	if (level == 1 || level == 2)
    {
        return 0.01;
    }
    else
    {
        return getLots(level - 1) + getLots(level - 2);
    }
}
// 获取下单间距
double getSpacing() {

	return spacing;
}

double getProfitTarget(int orderCount) {

	int x =  profitParamter - orderCount ;

	return ctrader.buyLot  * x;
}


void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");

}


