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
z = (a="Alice", b="Bob")
println(z.a) # Alice


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
function convabb(month=nowmonth, etc...)
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
result1 = convabb(3)             # 3()
result2 = convabb(7, 8)          # 7(8,)
result3 = convabb(10, months...) # 10(1, 2)

println(result1) # ["Mar"] 
println(result2) # ["Jul", "Aug"] 
println(result3) # ["Oct", "Jan", "Feb"]

month = Dates.format(Dates.now(), "mm")
println(convabb())      # ["Nov"]
println(convabb(month)) # ["Nov"]


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
x = 10
xtype = typeof(x)          # this
xxtype = supertype(xtype)  # above
xxxtype = subtypes(xxtype) # below

println("The type of this value is '$(xtype)'")
println("The type one above '$(xtype)' is '$(xxtype)'")
println("One type below '$(xxtype)' is '$(xxxtype)'")
# The type of this value is 'Int64'
# The type one above 'Int64' is 'Signed'
# One type below 'Signed' is 'Any[BigInt, Int128, Int16, Int32, Int64, Int8]'


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