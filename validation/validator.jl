module Representation
    using URIs
    
    abstract type BaseModel end
    struct ValidationError <: Exception end

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
            uri = URI(data)
            result = (scheme=uri.scheme, host=uri.host, path=uri.path, query=uri.query)
            startswith(result.scheme, "http") || error(ValidationError)
            new(network)
            return result
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
end