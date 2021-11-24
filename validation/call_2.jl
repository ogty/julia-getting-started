include("./validator.jl")

using .Representation

ipaddresslist = ["192.168.10.1", "192.168.10.500", "0.0.0.0", "127.0.0.1"]
validated = []

for ipaddress in ipaddresslist
    try
        IPv4Address(ipaddress)
        push!(validated, ipaddress)
    catch e
        println("Error: $ipaddress")
    end
end

println(validated)

# - Result - 
# Error: 192.168.10.500
# Any["192.168.10.1", "0.0.0.0", "127.0.0.1"]