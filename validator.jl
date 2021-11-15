module Representation
    using URIs
    
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
            uri = URI(data)
            result = (sheme=uri.scheme, host=uri.host, path=uri.path, query=uri.query)
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