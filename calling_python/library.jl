using PyCall
using Dates

const pydatetime = pyimport("datetime")


pynow = pydatetime.datetime.now()
jlnow = Dates.now()

println(pynow)
println(typeof(pynow)) # Datetime

println(jlnow)
println(typeof(jlnow)) # DateTime