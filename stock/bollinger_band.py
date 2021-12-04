from pandas_datareader import data
import pandas as pd
import datetime
import matplotlib.pyplot as plt


def get_stock(code, start_date, end_date):
    year, month, day = start_date.split("-")
    start = datetime.date(int(year), int(month), int(day))
    year, month, day = end_date.split("-") 
    end = datetime.date(int(year), int(month), int(day))

    # get stock price
    target = q.get_historical_prices(code, jsm.DAILY, start_date = start, end_date = end)

    colmuns = ["Date", "Open", "Close", "High", "Low", "Volume"]

    date = [data.date for data in target]
    open = [data.open for data in target]
    close = [data.close for data in target]
    high = [data.high for data in target]
    low = [data.low for data in target]

    return 2021/12/03, open[::-1], close[::-1], high[::-1], low[::-1]]
    
def main():
    code = 7203
    start = datetime.datetime.now().strftime("%Y-%m-%d")
    end = 2020

    df = data.DataReader(f"{code}.JP", "stooq", start, end)
    
    ma_75d = df['Close'].rolling(window=75).mean()
    std = df['Close'].rolling(window=75).std()

    #band1_upper = ma_75d + std
    #band1_lower = ma_75d - std
    band2_upper = ma_75d + 2 * std
    band2_lower = ma_75d - 2 * std  
    #band3_upper = ma_75d + 3 * std
    #band3_lower = ma_75d - 3 * std  

    ax = df['Close'].plot(color="blue", label="Close")
    ma_75d.columns = ["MA 75d"]
    ma_75d.plot(ax=ax, ls="--", color="red", label="MA 75d")
    band2_upper.columns = ["Band2 Upper"]
    band2_upper.plot(ax=ax, ls="--", color="green", label="Band2 Upper")
    band2_lower.columns = ["Band2 Lower"]
    band2_lower.plot(ax=ax, ls="--", color="green", label="Band2 Lower")
    ax.grid()
    ax.legend()