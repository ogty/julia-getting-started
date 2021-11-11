using PyCall


const pyabs = py"abs"
const pysum = py"sum"
const pysys = py"str"
const pyrange = py"range"


x = -10
data = [1, 2, 3, 4, 5]

println(typeof(x))   # String
println(pyabs(x))    # 10
println(pysum(data)) # 15


for i in pyrange(1, 10, 2)
    println(i)
end
# 1
# 3
# 5
# 7
# 9