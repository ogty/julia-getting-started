osbit = Sys.WORD_SIZE

if osbit == 64
    println("Hello 64bit user!")
elseif osbit == 32
    println("Hello 32bit user!")
else
    println("Who are you?")
end


# equal: maximum
function vectormax(data::Vector{Int64})
    max = first(data)
    for i in data
        if i > max
            max = i
        end
    end
    return max
end

data = [1, 2, 3, 4, 5]
result = vectormax(data)
println(result)