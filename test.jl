function Scraping(url)
    source = parsehtml(read(download(url), String))
    
    function classget(classname)
        sources = eachmatch(sel".$(classname)", html.root)