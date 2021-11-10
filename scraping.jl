using Gumbo
using Cascadia
using Plots
using Distributions
using StatsPlots


function scraping()
    result = []
    url = "https://info.finance.yahoo.co.jp/ranking/?kd=1&tm=d&mk=1"
    html = parsehtml(read(download(url), String))
    sources = eachmatch(sel".greenFin", html.root)
    for source in sources
        data = Gumbo.text(source)
        data = replace.(data, ","=>"")
        data = parse(Float64, data)
        push!(result, data)
    end
    return result
end

result = scraping()
result = sort!(result)
plot(result, st=:bar)
savefig("./img/price_increase_bar.png")