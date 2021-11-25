a = Dict{String, Int64}("Oct" => 10, "Nov" => 11)
b = Dict{String, Int64}("Nov" => 11, "Dec" => 12)
c = merge!(a, b)
println(c) # Dict("Dec" => 12, "Oct" => 10, "Nov" => 11)


# Using symbols can be more efficient than usual.
simple = Dict(:lang => "julia", :ide => "pluto")
println(simple[:lang]) # julia