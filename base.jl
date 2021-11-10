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
function vectormax(data::Vector{Int64})
    max = first(data)
    min = first(data)

    for i in data
        if i > max
            max = i
        elseif i < max
            min = i
        end
    end
    return max, min
end

data = [1, 2, 3, 4, 5]
max, min = vectormax(data)
println(max) # 5
println(min) # 1