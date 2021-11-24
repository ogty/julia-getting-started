include("./validator.jl")

using .Representation


@IPv4Address "192.168.10.1"   # true
@IPv4Address "192.168.10.500" # Error
