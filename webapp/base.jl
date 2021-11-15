using Genie
using Genie.Renderer, Genie.Renderer.Html

Genie.config.run_as_server = true

route("/") do
    html("<h1>Hello Julia!</h1>")
end

Genie.startup(port=8000)