# Control Structures ## Conditionalsx = 25 Statement blocks need an **end** statement. There is no colon at the end of the header and indentation is ignored by the interpreter (but you should, of course, still do it). if x > 20
    println("x is greater than 20")
end ### ExampleFizzBuzz test: given a number, *n*, print "Fizz" if *n* is divisible by 3, "Buzz" if *n* is divisible by 5, and "FizzBuzz" if *n* is divisible by 3 **and** 5. Otherwise just print *n* itself. n = 13if (n % 3 == 0) && (n % 5 == 0) 
    println("FizzBuzz")
elseif n % 3 == 0
    println("Fizz")
elseif n % 5 == 0
    println("Buzz")
else
    println(n)
endThe ternary operator should, in general, be avoided. x = 13
y = 6 

z = (x > y) ? x : y            # condition ? value if true : value if false 
println(z)## Iteration i = 0 
while i < 10 
    println("i is: ", i)
    i += 1 
endnums = [1, 2, 3, 4, 5, 6, 7, 80, 9]

for var in nums
    println(var)
endfor var in 1:10
    println(var) 
end 1:10      typeof(1:10)     # very similar to the range object in python 