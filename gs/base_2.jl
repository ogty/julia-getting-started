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