a = Symbol(":foo")
println(a) # :foo

b = Symbol("foo", :bar, 9)
println(b) # foobar9

println(:foo === Symbol("foo")) # true

function test()
    x = "local"
    eval(:(x = "global"))
    println(x)
end

test()     # local
println(x) # global

for (i, name) in enumerate([:A, :B, :C])
    @eval const $(Symbol(:FLAG_, name)) = $(UInt16(1) << (i - 1))
end

println(FLAG_A) # 1
println(FLAG_B) # 2
println(FLAG_C) # 4