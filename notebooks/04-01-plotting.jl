# Plotting ## Plotting Functions using Pkg 
Pkg.add("Plots") # only need to do this cell once using Plotsplot(sin, -2π, 2π)plot(x -> sin(x)^2 + cos(x)^3, -2π, 2π)  plot(
    x -> -log(x),
    0, 
    1000, 
    label="-log(x)", 
    xlabel="val", 
    ylabel="-log(x)", 
    title="Behavior of Negative Log"
)  
# Plots are by-default SVG ## Let's Plot some Values x = [1:10]y1, y2 = rand(10), rand(10)plot(x, y1, label="y1")  
plot!(x, y2, label="y2") # notice the exclamation mark# easier way to do this 

plot(x, [y1, y2], label=["First" "Second"])     

# y values can go in a list 
# notice the missing comma in the label argument plot(x, [y1, y2], seriestype=:scatter)     
plot(x, [y1, y2], seriestype=:scatter, thickness_scaling=0.7, opacity=0.8)     

# can also add a regression line with smooth=truey1, y2, y3, y4 = rand(10), rand(10), rand(10), rand(10)

plot(x, [y1, y2, y3, y4], opacity=0.8, palette=:Dark2_5)

# see more color schemes here: https://docs.juliaplots.org/latest/generated/colorschemes/All the different attributes can be seen here: 
https://docs.juliaplots.org/latest/attributes/#attributesWe have more on this after we work with some data wrangling! 