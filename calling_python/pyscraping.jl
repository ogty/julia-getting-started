using PyCall
using Plots

@pyimport requests
@pyimport bs4
const range = py"range"
const len = py"len"


@time begin
    function scraping(url, class_name)
        result = []
        html = requests.get(url, class_name)
        soup = bs4.BeautifulSoup(html.content, "html.parser")
        data = soup.select("[class='$(class_name)']")
        for i in range(1, len(data), 2)
            push!(result, parse(Float64, data[i].text))
        end
        return result
    end

    url = "https://info.finance.yahoo.co.jp/ranking/?kd=1&tm=d&mk=1"
    class_name = "geenFin"
    result = scraping(url, class_name)
    sort!(result, rev=true)
end