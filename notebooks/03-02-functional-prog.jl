# Basic Functional Programming Functional programming is very useful when thinking in terms of mathematics. It's also massively parallelizable and you really should learn the concepts. Here, we will take a look at some basics. ## Map Map applies a function to all elements of a collection. collection = [1, 2, 4]map(x -> x^2, collection)squares = map(x -> x^2, collection)@show squares`map` is, therefore, a **higher-order function** since it takes in a function as it's argument. Functional programming revolves around this very concept. It's very useful since, as you can see, it can be parallelized. There are complete algorithms that solve many common problems using functional programming concepts such as `map`, `reduce` and `filter`. ## Reduce 
collection = [1, 2, 4, 10]reduce(+, collection) # applies the function to first two elements, then result+3rd_element and so on ...  We will leave the rest of this for you to explore when you need this. We need to move to something much more relevant to Julia and our course of action. ## Broadcast Let's see this with an example. collection = [1, 2, 4]function f(x) 
    x ^ 2 
endbroadcast(f, collection) # seems similar to map collectionf.(collection) # it's so useful, it has a shortcut f(collection) # this does not work because you can't square an array Let's see how a broadcast call is different from a normal call. m = ones(3, 3)f(m) # this is m^2, which is m*m f.(m) # this applies x^2 to each element separately! A = [
    [1 2 3]
    [4 5 6]
    [7 8 9]
]A .+ 1 # apply +1 to each element separately A .* 2 # or even ... 
2A   f.(2A) # we can write stuff that is closer to the maths this way! This comes up again and again in Julia's practice. ### Broadcasting for Matrices A = [
    [1 2 3]
    [4 5 6]
]# Without broadcasting 
A * [10 20 30] # works if you transpose but that's a different operationA = [
    [1  2  3]
    [4  5  6]
]# With broadcasting 

A .* [10 20 30] # row vector is duplicated for each row A .* [10 20]' # column vector is duplicated for each column 