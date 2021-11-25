using Dates


# if
osbit = Sys.WORD_SIZE
if osbit == 64
    println("Hello 64bit user!")
elseif osbit == 32
    println("Hello 32bit user!")
else
    println("Who are you?")
end


# function
f1(x, y) = x + y
f2(x, y)::Int64 = x + y
println(f1(10, 20)) # 30
println(f2(20, 30)) # 50

println(+(1, 2, 3, 4, 5)) # 15
println(*(1, 2, 3, 4, 5)) # 120


# anonymous functions
data = [10, 20, 30]
data10x = map(x -> x * 10, data)
println(data10x) # [100, 200, 300]


# named tuples
z = (a="Alice", b="Bob", c="Callie")
println(z.a)       # Alice
println(z[2])      # Bob
println(z[:c])     # Callie
println(keys(z))   # (:a, :b, :c)
println(values(z)) # ("Alice", "Bob", "Callie")


# unpacking return values
function vectorminmax(data::Vector{Int64})
    min = first(data)
    max = first(data)

    for i in data
        if i > max
            max = i
        elseif i < max
            min = i
        end
    end
    return min, max
end

data = [1, 2, 3, 4, 5]
min, max = vectorminmax(data)
println(min) # 1
println(max) # 5


# argument destructuring
minmax(x, y) = (y < x) ? (y, x) : (x, y)
range((min, max)) = max - min

result1 = range(minmax(10, 5))
result2 = range(minmax(5, 15))

println(result1) # 5
println(result2) # 10


# varargs functions and optional arguments
# The following is a subtle example...

# convert abbreviations
today = Dates.today()
nowmonth = Dates.format(today, "mm")
function convabb1(month=nowmonth, etc...)
    result = []
    months = Dict{Int64, String}(
        1  => "Jan", 2  => "Feb", 3  => "Mar",
        4  => "Apr", 5  => "May", 6  => "Jun",
        7  => "Jul", 8  => "Aug", 9  => "Sep",
        10 => "Oct", 11 => "Nov", 12 => "Dec"
    )

    if typeof(month) == String
        month = parse(Int, month)
    end
    for i in etc
        push!(result, months[i])
    end

    println(month, etc)
    push!(result, months[month])
    return result
end

months = [1, 2]
result1 = convabb1(3)             # 3()
result2 = convabb1(7, 8)          # 7(8,)
result3 = convabb1(10, months...) # 10(1, 2)

println(result1) # ["Mar"] 
println(result2) # ["Jul", "Aug"] 
println(result3) # ["Oct", "Jan", "Feb"]

month = Dates.format(Dates.now(), "mm")
println(convabb1())      # ["Nov"]
println(convabb1(month)) # ["Nov"]


# keyword arguments
function classborder(class; style="solid", width="1", color="black")
    result = """
    .$(class) {
        border: $style $(width)px $color;     
    }
    """
    println(result)
end

classborder("main", color="red")
# .main {
#     border: solid 1px red;
# }


# do-block syntax for function arguments
result = map([7, 18, 50]) do x
    if 77 <= x
        return "Old age"
    elseif 46 <= x <= 76
        return "Middle age"
    elseif 18 <= x <= 45
        return "Youth"
    elseif 6 <= x <= 17
        return "Boy"
    else
         return "Childhood"
    end
end

println(result) # ["Boy", "Youth", "Middle age"]


# examine the hierarchical relationship of types
"""
Currently, for some reason, 
subtypes is not available, 
so I have commented it out.

It works in REPL.
"""
x = 10
xtype = typeof(x)          # this
xxtype = supertype(xtype)  # above
# xxxtype = subtypes(xxtype) # below

println("The type of this value is '$(xtype)'")
println("The type one above '$(xtype)' is '$(xxtype)'")
# println("One type below '$(xxtype)' is '$(subtypes(Number))'")
# The type of this value is 'Int64'
# The type one above 'Int64' is 'Signed'
# One type below 'Signed' is 'Any[BigInt, Int128, Int16, Int32, Int64, Int8]'

println(xtype <: Number)  # true
println(xxtype >: Number) # false


# nothing type
result = findfirst("x", "Hello Julia!")
println(result) # nothing


# composite types
struct MyCalc
    data::Vector{Int64}
end

function mysum(mc::MyCalc)
    result = 0
    for i in mc.data
        result += i
    end
    return result
end

function mymean(mc::MyCalc)
    result = mysum(mc) / length(mc.data)
    return result
end

data = [1, 2, 3, 4, 5]
mc = MyCalc(data)

println(mysum(mc))  # 15
println(mymean(mc)) # 3.0


mutable struct MyCalc2
    data::Vector{Int64}
end

function mysum2(mc::MyCalc2)
    result = 0
    for i in mc.data
        result += i
    end
    push!(mc.data, result)
    return result
end

function mymean2(mc::MyCalc2)
    result = mysum2(mc) / length(mc.data)
    return result
end

data = [2, 4, 5, 6, 7]
mc = MyCalc2(data)

println(mysum2(mc))  # 24
println(mymean2(mc)) # 6.857142857142857


# union type
IntOrString = Union{Int, String}
uniontype(x::IntOrString) = x

uniontype("Bob") # String
# uniontype(1.5)   Error


# parametric type
mutable struct Convabb{T}
    data::T
end

function convabb2(ca::Convabb{String})::Int64
    months = Dict{String, Int64}(
    "Jan" => 1,  "Feb" => 2,  "Mar" => 3,
    "Apr" => 4,  "May" => 5,  "Jun" => 6,
    "Jul" => 7,  "Aug" => 8,  "Sep" => 9,
    "Oct" => 10, "Nov" => 11, "Dec" => 12
    )
    return months[ca.data]
end
function convabb2(ca::Convabb{Int64})::String
    months = Dict{Int64, String}(
        1  => "Jan", 2  => "Feb", 3  => "Mar",
        4  => "Apr", 5  => "May", 6  => "Jun",
        7  => "Jul", 8  => "Aug", 9  => "Sep",
        10 => "Oct", 11 => "Nov", 12 => "Dec"
    )
    return months[ca.data]
end

function convabb2(ca::Convabb)
    throw("Error")
end

ca1 = Convabb("Nov")
ca2 = Convabb(12)
ca3 = Convabb(8.5)

println(convabb2(ca1))   # 11
println(convabb2(ca2))   # Dec
# println(convabb2(ca3))   Error

println(typeof(convabb2(ca1))) # Int64
println(typeof(convabb2(ca2))) # Float64
# println(typeof(convabb2(ca3))) Error
