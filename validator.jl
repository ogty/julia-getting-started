abstract type BaseModel end


mutable struct Networks
    url
    Networks(url="") = new(url)
end
mutable struct HttpUrl <: BaseModel
    network::Networks
    function HttpUrl(data, network::Networks=Networks(url))
        startswith(data, "http") || error("ValidationError")
        new(network)
    end
end



url = "https://github.com/"
# url = "/github.com/"

# type1
HttpUrl(url)::BaseModel

# type2
function MyValidator(self::BaseModel) end
MyValidator(HttpUrl(url))