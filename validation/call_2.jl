include("./validator.jl")

using .Representation

@IPv4Address "192.168.10.1"   # nothing
@IPv4Address "192.168.10.500" # Error