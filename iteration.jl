x = [i for i in 1:4]
y = [i for i in 1:2:10]
println(length(x)) # 4
println(length(y)) # 5

for (i, j) in zip(x, y)
    println((i, j))
end
# (1, 1)
# (2, 3)
# (3, 5)
# (4, 7)