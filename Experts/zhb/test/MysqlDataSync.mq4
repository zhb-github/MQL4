#property copyright "zouhaibo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| mysql数据同步，定时对mysql的数据进行同步                |
//+------------------------------------------------------------------+


#include <MQLMySQL.mqh>

//  1. 连接mysql
//  2. 获取账户信息，账户id
//  3. 获取mysql 最后一个订单的订单id
//  4. 按照时间循序，从最后一个订单开始同步
//

int DBConnection ;

int OnInit() {

	DBConnection = MySqlConnect("8.130.167.166", "root", "abcabc123", "mt4", 33060, "", 0);
    if (DBConnection== -1)
    {
     Print("Error #", MySqlErrorNumber, ": ", MySqlErrorDescription);

    }


	int userId = AccountNumber();
	string Query;
    int    i,Cursor,Rows;

	int lastSyncOrderId =0 ;

	Query = "SELECT order_id FROM `trade` WHERE `current_user_id` = " + IntegerToString(userId) + " AND `account_server` = '"+AccountServer()+"' ORDER BY open_time desc limit 1";

	printf("SQL> %s",  Query);

	Cursor = MySqlCursorOpen(DBConnection, Query);
	if(Cursor >=0){
		Rows = MySqlCursorRows(Cursor);
		for (i=0; i<Rows; i++){

	         if (MySqlCursorFetchRow(Cursor))
	            {
	                lastSyncOrderId = MySqlGetFieldAsInt(Cursor, 0); // id
	            }
		}
	}
	PrintFormat("lastSyncOrderId: "+ lastSyncOrderId);
	// 全部同步

	string inertStr = "";
	for(int i = 0; i< OrdersHistoryTotal(); i ++)
	{

		OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);

		if(OrderTicket() > lastSyncOrderId){
			// 没有成交的订单不需要插入，金额转入转出也不需要
			if(OrderType() == OP_BUY || OrderType() == OP_SELL){



				int masterUserId = 0;
				int parentOrderId = 0;

				if(StringLen(OrderComment()) >0 && StringFind(OrderComment(),"@") >= 0){

					ushort u_sep =StringGetCharacter("@",0);
					string result[];
					int k = StringSplit(OrderComment(),u_sep,result);
					masterUserId =  result[1];
					parentOrderId = result[2];
				}

				inertStr = "INSERT INTO `trade` (`id`,`account_server`, `current_user_id`, `parent_user_id`, `order_id`, `parent_order_id`,`group_order_id`, `symbol`, `type`, `lots`, `open_price`, `take_profit`, `stop_loss`, `close_price`, `open_time`, `close_time`,`commission`, `swap`, `profit`, `comment`) VALUES (NULL, '"+AccountServer()+"',"
				+userId+", "+masterUserId+", "+OrderTicket()+", "+parentOrderId+", '0', '"+OrderSymbol()+"', "+OrderType()+", "+OrderLots()+", "+OrderOpenPrice()+", "+OrderTakeProfit()+", "+OrderStopLoss()+", "+OrderClosePrice()+
				", '"+TimeToString(OrderOpenTime(), TIME_DATE|TIME_SECONDS)+"', '"+TimeToString(OrderCloseTime(), TIME_DATE|TIME_SECONDS)+"', "+OrderCommission()+", "+OrderSwap()+", "+OrderProfit()+", '"+OrderComment()+"');";
				printf("SQL> %s",  inertStr);
				if (MySqlExecute(DBConnection, inertStr))
		        {
		         Print ("Succeeded! rows has been inserted by one query.");
		        }
			}

		}


	}

	ExpertRemove();
	return 0;
}



void OnDeinit(const int reason)
{
//--- destroy timer
   EventKillTimer();

   Print("OnDeinit method execute");
   MySqlDisconnect(DBConnection);
}



