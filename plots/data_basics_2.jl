using DataFrames
using CSV
using Plots


df = CSV.File("../data/anscombe.csv") |> DataFrame
df.id = 1:nrow(df)


xlim = collect(extrema(Matrix(select(df, r"x"))) .+ (-1, 1))
ylim = collect(extrema(Matrix(select(df, r"y"))) .+ (-1, 1))

plot_array = Any[]

for i in 1:4    
    x_vals = df[:, "x$i"]
    y_vals = df[:, "y$i"]
    
    p = plot(x_vals, y_vals, 
              seriestype=:scatter, 
              xlabel="x$i", ylabel="y$i",
              xlims=xlim, ylims=ylim, 
              smooth=true,
              opacity=0.8, palette=:Dark2_5, 
            ) 
    
    push!(plot_array, p)
end

plot(plot_array..., layout=(2, 2), legend=false, size=(800, 400))
savefig("../img/graph_2.png")