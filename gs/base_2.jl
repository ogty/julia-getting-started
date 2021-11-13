using Statistics: mean, std


# list
list = [1, 2]

push!(list, 3)
println(list) # [1, 2, 3]

pop!(list)
println(list) # [1, 2]

insert!(list, 2, 100)
println(list) # [1, 100, 2]

deleteat!(list, list[end])
println(list) # [1, 2]


# dict
d = Dict{String, Int64}()
d["a"] = 10
d["b"] = 20

println(d)              # Dict("b" => 20, "a" => 10)
println(haskey(d, "a")) # true


# set
s = Set([1, 2, 3])

println(s) # [2, 3, 1]

push!(s, 3)
println(s) # [2, 3, 1]

println(union(s, [3, 4]))     # [4, 2, 3, 1]
println(intersect(s, [1, 2])) # [2, 1]
println(issubset([1, 3], s))  # true


data1 = Array{Float64}(undef, 3, 2)
data2 = zeros(Float64, 3, 2)
data3 = ones(Float64, 3, 2)
data4 = rand(Float64, 3, 2)
data5 = randn(Float64, 3, 2)
data6 = fill(1.1, 3, 2)

println(data1)
println(data2)
println(data3)
println(data4)
println(data5)
println(data6)

copied = similar(data5, Float64)
changed = reshape(data6, 2, 3)

println(copied)
println(changed)

println(eltype(data1))
println(length(data1))
println(ndims(data1))
println(size(data1))
println(size(data1, 1))
println(strides(data1))
println(stride(data1, 2))

A = collect(reshape(1:9, 3, 3))
println(A)


data7 = [1, 2, 3, 4, 5]
println(mean(data7)) # 3.0
println(std(data7))  # 1.5811388300841898
# println(var(data7))  Error


module MyCalc
    export mysum

    function mysum(data::Vector{Int64})
        result = 0
        for i in data
            result += i
        end
        return result
    end
    function mymean(data::Vector{Int64})
        return MyCalc.mysum(data) / length(data)
    end
end

using .MyCalc

println(mysum(data7))         # 15
# println(mymean(data7))      Error
println(MyCalc.mymean(data7)) # 3.0