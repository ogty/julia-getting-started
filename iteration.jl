# length is difference...
x = [i for i in 1:4]
y = [i for i in 2:10]
println(length(x))
println(length(y))

# but, OK
for (i, j) in zip(x, y)
    println((i, j))
end