# Interfacing with Other Languages ## Calling Python Builtins and Custom CodeFirst, let's install the package needed to interface with Python code. We give this as a **package mode** command. ] add PyCallusing PyCallmath = pyimport("math")
math.sin(math.pi / 4)math.sqrt(36)push!(pyimport("sys")["path"], pwd())pyex = pyimport("pyex")pyex.sqrt(36)pyimport("importlib")."reload"(pyex) # if you change something in python module, you have to reload itpyex.sqrt(36)## Calling RI don't have R installed on my machine but if you do, you can run this simple example to see how you can call R operations from within Julia. ] add RCallusing RCallX = randn(3, 2)
b = reshape([2.0, 3.0], 2, 1)
y = X * b + randn(3, 1)Xby@rput y
@rput XR"z <- y * 3" # do something in R @rget z
@show z # z should now be available in Julia 