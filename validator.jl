module Representation
    abstract type BaseModel end

    # Original Error
    struct ValidationError <: Exception end

    # Netowrks Model
    url = ""
    ipv4address = ""
    ipv6address = ""
    mutable struct _Networks
        url::String
        ipv4address::String
        ipv6address::String

        _Networks(
            url="",
            ipv4address="",
            ipv6address=""
            ) = begin new(
                url, 
                ipv4address,
                ipv6address
                )
                end
    end
    mutable struct HttpUrl <: BaseModel
        network::_Networks
        function HttpUrl(data, network::_Networks=_Networks(url))
            startswith(data, "http") || error(ValidationError)
            new(network)
        end
    end
    mutable struct IPv4Address <: BaseModel
        network::_Networks
        function IPv4Address(data, network::_Networks=_Networks(data))
            splited = split(data, ".")
            valid = [parse(Int64, b) for b in splited]
            valid = [b for b in valid if b >= 0 & b <= 255]
            length(splited) == 4 & length(valid) == 4 || error(ValidationError)
            new(network)
        end
    end
    mutable struct IPv6Address <: BaseModel
        network::_Networks
        function IPv6Address(data, network::_Networks=_Networks(data))
            """
            
            """
            # error(ValidationError)
            new(network)
        end
    end
end


import .Representation: BaseModel, HttpUrl, IPv4Address

urls = ["http://www.google.com/", "https://github.com/", "/support", "/profile"]
validated = []
for url in urls
    try
        HttpUrl(url)::BaseModel
        push!(validated, url)
    catch
        println("Error: $url")
    end
end
println(validated)


println()


ipv4s = ["192.168.100.1", "192.168.1"]
validated = []
for ipv4 in ipv4s
    try
        IPv4Address(ipv4)::BaseModel
        push!(validated, ipv4)
    catch
        println("Error: $ipv4")
    end
end
println(validated)
