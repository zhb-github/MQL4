// standard timeframe: PERIOD_M1, PERIOD_M5, PERIOD_M15, PERIOD_M30, PERIOD_H1, PERIOD_H4, PERIOD_D1, PERIOD_W1, PERIOD_MN1
// non-standard timeframe: PERIOD_M2, PERIOD_M3, PERIOD_M4, PERIOD_M6, PERIOD_M10, PERIOD_M12, PERIOD_M20, PERIOD_H2, PERIOD_H3, PERIOD_H6, PERIOD_H8, PERIOD_H12
class CIndic {
    public:
        double atr(int _shift=0, int _timeframe=0) {
            return iATR(NULL,_timeframe,14,_shift);
        }

        // mode: 0-MODE_MAIN, 1-MODE_UPPER, 2-MODE_LOWER
        double bands(int _mode, int _shift=0, int _timeframe=0) {
            return iBands(NULL,_timeframe,20,2,0,PRICE_CLOSE,_mode,_shift);
        }

        // method: 0-MODE_SMA, 1-MODE_EMA, 2-MODE_SMMA, 3-MODE_LWMA
        double ma(int _period, int _shift=0, int _method=MODE_EMA, int _timeframe=0) {
            return iMA(NULL,_timeframe,_period,0,_method,PRICE_CLOSE,_shift);
        }

        // mode: 0-MODE_MAIN, 1-MODE_SIGNAL
        double macd(int _mode, int _shift=0, int _timeframe=0) {
            return iMACD(NULL,_timeframe,12,26,9,PRICE_CLOSE,MODE_MAIN,_shift);
        }

        double rsi(int _shift=0, int _timeframe=0) {
            return iRSI(NULL,_timeframe,14,PRICE_CLOSE,_shift);
        }

        double deviation(int _period, int _shift=0, int _method=MODE_EMA, int _timeframe=0) {
            return iStdDev(NULL,_timeframe,_period,0,_method,PRICE_CLOSE,_shift);
        }

        datetime time(int _shift=0, int _timeframe=0) {
            return iTime(NULL,_timeframe,_shift);
        }

        double open(int _shift=0, int _timeframe=0) {
            return iOpen(NULL,_timeframe,_shift);
        }

        double high(int _shift=0, int _timeframe=0) {
            return iHigh(NULL,_timeframe,_shift);
        }

        double low(int _shift=0, int _timeframe=0) {
            return iLow(NULL,_timeframe,_shift);
        }

        double close(int _shift=0, int _timeframe=0) {
            return iClose(NULL,_timeframe,_shift);
        }

        // type: 0-MODE_OPEN, 1-MODE_LOW, 2-MODE_HIGH, 3-MODE_CLOSE, 4-MODE_VOLUME, 5-MODE_TIME
        double highest(int _type, int _count, int _start=0, int _timeframe=0) {
            return iHighest(NULL,_timeframe,_type,_count,_start);
        }

        // type: 0-MODE_OPEN, 1-MODE_LOW, 2-MODE_HIGH, 3-MODE_CLOSE, 4-MODE_VOLUME, 5-MODE_TIME
        double lowest(int _type, int _count, int _start=0, int _timeframe=0) {
            return iLowest(NULL,_timeframe,_type,_count,_start);
        }
};