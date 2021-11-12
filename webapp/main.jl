using Genie
using Genie.Renderer,Genie.Renderer.Html, Genie.Renderer.Json, Genie.Renderer.render

Genie.config.run_as_server = true

route("/") do
    # html("<h1>Hello Julia!")
    render("test.html")
    rende
end

Genie.startup()

# Genie.Renderer.render("test.html")