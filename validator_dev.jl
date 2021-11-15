abstract type BaseModel end

# Original Error
struct ValidationError <: Exception end

# Netowrks Model
url = ""
ipv4address = ""
mutable struct _Networks
    url::String
    ipv4address::String

    _Networks(url="", ipv4address="") = new(url, ipv4address)
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
        valid = [b for b in valid if b >= 0 & b<=255]
        length(splited) == 4 & length(valid) == 4 || error(ValidationError)
        new(network)
    end
end

test = "192.168.11.1"
# test = "192.168.11"

IPv4Address(test)::BaseModel