using PyCall


const pydatetime = pyimport("datetime")


println(pydatetime.datetime.now())