include("./validator.jl")

import .Representation: HttpUrl, IPv4Address


urls = ["http://www.google.com/", "https://github.com/", "/support", "/profile"]
validated = []
for url in urls
    try
        result = HttpUrl(url)
        println("host : $(result.host)")
        push!(validated, url)
    catch
        println("Error: $url")
    end
end
println(validated)
# host : www.google.com
# host : github.com
# Error: /support
# Error: /profile
# Any["http://www.google.com/", "https://github.com/"]

ipv4s = ["192.168.100.1", "192.168.1"]
validated = []
for ipv4 in ipv4s
    try IPv4Address(ipv4), push!(validated, ipv4) catch end
end
println(validated)
# Any["192.168.100.1"]