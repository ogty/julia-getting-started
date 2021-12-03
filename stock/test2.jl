using PyCall
using DataFrame

const pandas_datareader = pyimport("pandas_datareader")


df = pandas_datareader.data.DataReader("^DJI","yahoo")
df = pandas_datareader.data.DataReader("^DJI","yahoo", start="2020-11-01", end="2020-11-14")

	
df = data.DataReader("7203.JP", "stooq")