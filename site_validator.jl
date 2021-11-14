using Gumbo
using Cascadia
using Plots
using Distributions
using StatsPlots


function scraping(url)
    result = []
    html = parsehtml(read(download(url), String))
    sources = eachmatch(sel".greenFin", html.root)
    for i in 1:2:length(sources)
        data = Gumbo.text(sources[i])
        data = parse(Float64, data)
        push!(result, data)
    end
    return result
end

url = "https://info.finance.yahoo.co.jp/ranking/?kd=1&tm=d&mk=1"
result = scraping(url)
result = sort!(result, rev=true)