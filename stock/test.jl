using Pkg; Pkg.add("Quandl")

using Quandl
using DataFrame


set_auth_token("myauthtoken")
# https://Quandl.com

quandl("GOOG/NASDAQ_QQQ", format="DataFrame")
df = quandlsearch("GDP USA", results=30)
names(df)
df[:Name]
s = quandlsearch("GDP USA", format="Dict")
s[1]
s[1]["name"]
s[1]["updated_at"]
a = interactivequandl("USA GDP")