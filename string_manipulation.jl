# slice
hello = "Hello world!"
println(hello[1:4]) # Hell
println(hello[end]) # !


# copy
copied = SubString(hello, 1, 5) # Hello


# replace
name1 = "Julia"
name2 = replace.(name1, "a"=>"e")
println(name1) # Julia
println(name2) # Julie


# join
println(string(copied, " ", name1)) # Hello Julia
println(copied * " " * name2)       # Hello Julie


# interpolation
println("Hello $name1 !")
println("1 + 2 = $(1 + 2)")


# triple-quoted string literals
julia = """
               _
   _       _ _(_)_    
  (_)     | (_) (_)  
   _ _   _| |_  __ _  
  | | | | | | |/ _` |
  | | |_| | | | (_| |
 _/ ||__'_|_|_||__'_|
|__/
"""
println(julia)


# alphabetical order
println("Alice" < "Bob") # true
println(name1 == name2)  # false
 

# search
indexfirst = findfirst(isequal('o'), "Hello world!")
indexnext = findnext(isequal('o'), "Hello world!", 6) # Number larger than the first index
println(indexfirst) # 5
println(indexnext)  # 8


# include
println(occursin("world", "Hello, world.")) # true


# repeat
println(repeat("Z", 3) * repeat("z", 5) * repeat(".", 3)) # ZZZzzzzz...


# split and join
splitedhello = split(hello)
joinedhello = join(splitedhello, ", ")
println(splitedhello) # ["Hello", "world!"]
println(joinedhello)  # Hello world! ---> Hello, world!


# length
println(length(joinedhello)) # 13


# regular expressions
btcdata = "BTC:7,539,250.23yen -1.65%"
btcprice = match(r"(?<=:).*(?=yen)", btcdata)
println(btcprice) # 7,539,250.23