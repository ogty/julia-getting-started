check(data) = length(data) >= 5 || error("The number of data must be at least 5.") 
# println(check([1, 2, 3]))       Error
println(check([1, 2, 3, 4, 5])) # truedrink(age) = age >= 20 ? "You can drink alcohol." : "You can't drink alcohol."

println(drink(19)) # You can't drink alcohol.
println(drink(25)) # You can drink alcohol.

# =, in, and ∈ can be used in the same way
for i = 1:2, j in 2:3, k ∈ 3:4
    println((i, j, k))
end

# There are two main ways to write file operations
open("../data/hello.txt", "w") do io
    write(io, "Hello world!\n")
end

f = open("../data/hello.txt", "a")
try
    write(f, "Hello Julia!")
finally
    close(f)
end

function multiplication1(x, y)
    return x * y
end

multiplication2(x, y) = x * y
multiplication3(x::Int64, y::Int64)::Int64 = x * y
multiplication4 = (x, y) -> x * y;

println(multiplication1(5, 6))               # 30
println(multiplication2(2, 5))               # 10
println(multiplication2("Hello", " world"))  # Hello world
println(multiplication3(3, 8))               # 24

try
    println(multiplication3("Hello", " world"))
catch
    println("Error")
end

println(multiplication4(8, 9)) # 72


array = ["1", "2", "3", "4", "5"]
convedarray = map(x -> parse(Int64, x), array)
println(typeof(array))       # Vector{String}
println(typeof(convedarray)) # Vector{Int64}# Type annotation for variable number of arguments
function sum(data::Int64...)
    result = 0
    for i in data
        result += i
    end
    return typeof(data), result
end

datatype, result = sum(1, 2, 3, 4, 5)
println(datatype) # NTuple{5, Int64}
println(result)   # 15