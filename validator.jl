module Representation
    export BaseModel
    export HttpUrl

    # Top
    abstract type BaseModel end

    # Original Error
    struct ValidationError <: Exception end

    # Netowrks Model
    url = ""
    mutable struct _Networks
        url::String
        _Networks(url) = new(url)
    end
    mutable struct HttpUrl <: BaseModel
        network::_Networks
        function HttpUrl(data, network::_Networks=_Networks(url))
            startswith(data, "http") || error(ValidationError)
            new(network)
        end
    end
end


import .Representation: BaseModel, HttpUrl

urls = ["http://www.google.com/", "https://github.com/", "/support", "/profile"]
validated = []
for url in urls
    try
        HttpUrl(url)::BaseModel
        push!(validated, url)
    catch
    end
end

println(validated)