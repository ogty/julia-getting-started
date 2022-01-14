# Welcome to Julia! Basic Syntax awesome_var = 25awesome_var \:smile_cat:         # tab completion 😺  = "😺"     # julia is fully unicode! 😺 typeof(😺)typeof('a')typeof("a")σ = 2.5        # \sigma with tab completion sqrt(σ^2)println("σ = ", σ)? printlnanswer = 42
typeof(answer)e = 3.141
typeof(e)a, b = 10, 20println(a)
println(b):4          # literal type typeof(:4):besttypeof(:b)println(b)## Basic Arithmetic println(3+5, 3-1, 3*4, 3/5, 6%4)      # not what you expect! println("a", "b")println([ 3+5, 3-1, 3*4, 3/5, 6%4 ])     typeof([1, 2, 4.0])     # everything is converted to a Float64 print("a")
print("b")   # no new line at end 4//2    # builtin support for rationals 5//2 + 4//2 convert(Int64, 1)  convert(Float64, 1)  convert(Int64, 1.3)  ## Boolean Operators val_t = true 
val_f = false;       # the final semicolon supresses output val_t && val_fval_t || val_f!val_t## String Operations name = "John"
age = 35
println("The customer's name is $(name) who is $(age) years old.")s1 = "Awesome" 
s2 = "Blossom" s1 * s2join([s1, s2], " ")alphabet = ['a', 'b', 'c', 'd']
join(alphabet, ' ')s1 ^ 3  # you've already seen this # Pro tip: If you're working in the notebook, 
#    you can right-click and click on 
#    'New Console for Notebook' 
#    for experimentation (console is tile-able too)