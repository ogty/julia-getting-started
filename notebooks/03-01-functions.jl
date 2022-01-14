# Functions # basic function definition 

function square(x)
    return x * x 
end 

# value of the expression on the last line of execution is 
# automatically returned 
# it's still good practice to use 'return' square(4)function hello(name)
    println("Hello there ", name)
endhello("world")hello(1) # automatic overloading through "duck typing"v = rand(3, 4)hello(v) # just as long as you can "print" the parameter, it's fineShorthand for simple one-liners. halver(x) = x // 2      halver(5)## Convention for Mutating Functions v = [46, 5, 87];sort(v) @show vsort!(v) # the bang, by convention is for mutation @show vNote that `sort` and `sort!` are completely different functions. ## Overloading and "Methods"function show_number(x::Int64)
    println("Printing integer value: ", x)
endshow_number(65)show_number(65.0)function show_number(x::Float64)
    println("Printing float value: ", x)
endshow_number(65)
show_number(65.0)methods(show_number) # see which "overloaded" methods we have. Read the terminology! methods(+)## Default Values log(8) # natural log by default log(2, 8)function collection_log(collection, base=2)   
    return [log(base, i) for i in collection]
end collection_log([4, 8, 16])### Some Issues with Default and Keyword Arguments function collection_log2(base=2, collection) # incorrect order  
    return [log(base, i) for i in collection]
end function collection_log2(base=2; collection)    
    return [log(base, i) for i in collection]
end collection_log2(10, collection=[4, 8, 16]) # but now, collection is keyword. So, have to write it. It's good to know the syntax of these but for your own code, you should be defining just using the first method until you get comfortable with it. ## Anonymous Functions Sometimes, you don't want to name a function. If you haven't seen this before, this might seem weird but it's actually pretty useful. We'll see a case study in a little while but let's first see the syntax. x -> x^2 + 2x - 1 # the 'arrow' operator is what makes this a function # but now we don't have a name for this function so we can't call it! (x -> x^2 + 2x - 1)(5) # we can, but this feels ... useless Let's see a usecase for this. # given this collection, we want to remove all the values that are a multiple of 3 
nums = [1, 2, 4, 5, 6, 7, 8, 9]filter!(some_function_here, some_collection_here) # filter function keeps only those that satisfy the criteria  function not_multiple_of_three(x) 
    return x % 3 != 0 
end filter!(not_multiple_of_three, nums )... but that seems so long and this function is now useless after this call. If we're not going to call this function later (or even before), why don't we just make it "anonymous"? nums = [1, 2, 4, 5, 6, 7, 8, 9]filter!(x -> x % 3 != 0, nums)numsHere's something cool that Julia does! Since `!=` is just a function, we can reassign it to a unicode character to make it a little prettier. nums = [1, 2, 4, 5, 6, 7, 8, 9]≠  =  != # \ne [and hit tab] for the unicode symbol filter!(x -> x % 3 ≠ 0, nums) # just makes it look a little closer to the maths it comes from ## Splatting and Slurping There is a lesser known operator, `...`, which causes a lot of confusion. You will probably come across it sometimes, so it's best to clarify it here. function print_vals(a, b, c)
    println("First param : ", a)
    println("Second param: ", b)
    println("Third param : ", c)
endprint_vals(1, 2, 3)vals = [1, 2, 3]print_vals(vals...) # `splat` the list into three different values We can also do the opposite of this: function add_vals(collection)
    for (index, value) in enumerate(collection)
        println("$index: $value")
    end
end add_vals("apple", "banana", "strawberry")    
# can't call it with 3 values   function add_vals(collection...) # this is called slurping 
    for (index, value) in enumerate(collection)
        println("$index: $value")
    end
end add_vals("apple", "banana", "strawberry").
.


This may not look too useful but it sometimes makes your code cleaner and many modern libraries and packages use this syntax so it's good to know what the `...` means. a, b = (1, 2, 4) @show a, b; # not what you would expect! a, b... = (1, 2, 4) # ... to be added in a future version of Julia