x = +3
y = -1
t = true
f = false

println("""
x = +3
y = -1
t = true
f = false
""")

println("x + y  = $(x + y)")
println("x - y  = $(x - y)")
println("x * y  = $(x * y)")
println("x / y  = $(x / y)")
println("x ÷ y  = $(x ÷ y)")
println("x \\ y  = $(x \ y)")
println("x ^ y  = $(y ^ x)")
println("x % y  = $(x % y)")
println("x < y  = $(x < y)")
println("x <= y = $(x <= y)") # x ≤ y
println("x > y  = $(x > y)") 
println("x >= y = $(x >= y)") # x ≥ y
println("!true  = $(!t)")
println("-false = $(-f)")
println("true & false   = $(t & f)")
println("true | false   = $(t | f)")
println("true ⊻ false   = $(t ⊻ f)")
println("true >>> false = $(t >>> f)")
println("true >> false  = $(t >> f)")
println("true << false  = $(t << f)")
println("true == flase  = $(t == f)")
println("true != false  = $(t != f)") # x ≠ y