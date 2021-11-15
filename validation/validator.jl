module Representation
    abstract type BaseModel end
    
    using URIs

    export @HttpUrl
    export @IPv4Address
    export HttpUrl
    export IPv4Address

    struct ValidationError <: Exception end

    const url = ""
    const ipv4address = ""
    mutable struct _Networks
        url          ::String
        ipv4address  ::String
        _Networks(url="", ipv4address="") = new(url, ipv4address)
    end

    """
        @HttpUrl

    This **HttpUrl macro** returns a boolean value as an argument, but the **HttpUrl function** returns the result of parsing the URL.

    # Examples

    ```julia-repl
    julia> url1 = "https://example.com/"

    julia> url2 = "/support"

    julia> @HttpUrl url1
        true

    julia> @HttpUrl url2
        ERROR: ValidationError
    ```
    """
    macro HttpUrl(data)
        :(startswith((URI($data).scheme), "http") || error(ValidationError))
    end

    """
        @IPv4Address

    This **IPv4Address macro** returns a boolean type as the return value, unlike the **IPv4Address function**.

    # Examples

    ```julia-repl
    julia> address1 = "192.168.10.1"

    julia> address2 = "123.456.789.100"

    julia> @IPv4Address address1
        true

    julia> @IPv4Address address2
        ERROR: ValidationError
    ```
    """
    macro IPv4Address(data)
        :(begin
                splited = split($data, ".")
                valid = [parse(Int64, b) for b in splited]
                valid = [b for b in valid if 0 <= b <= 255]
                length(splited) == 4 & length(valid) == 4 || error(ValidationError)
            end)
    end
    
    
    """
        HttpUrl

    The **HttpUrl function**, unlike the **HttpUrl macro**, returns the value parsed by the **URIs module** as a named tuple as the return value. 
    It is assumed that the **HttpUrl macro** will be used when just validating.

    # Examples

    ```julia-repl
    julia> url1 = "https://example.com/"

    julia> url2 = "/support"

    julia> result = HttpUrl(url1)
        (scheme = "https", host = "example.com", path = "/", query = "")

    julia> result.host
        "example.com"

    julia> HttpUrl(url2)
        ERROR: ValidationError
    ```
    """
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

    """
        IPv4Address
    
    The docstring for this function will be written when the function is added.

    # Examples

    ```julia-repl
    julia> 
    ```
    """
    mutable struct IPv4Address <: BaseModel
        network::_Networks
        function IPv4Address(data, network::_Networks=_Networks(data))
            splited = split(data, ".")
            valid = [parse(Int64, b) for b in splited]
            valid = [b for b in valid if 0 <= b <= 255]
            length(splited) == 4 & length(valid) == 4 || error(ValidationError)
            new(network)
        end
    end
end