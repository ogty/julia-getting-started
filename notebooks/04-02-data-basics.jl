# Data Basics ## Reading CSV Files ] add DataFrames # usually not needed] add CSV # usually not neededusing DataFramesusing CSVdf = CSV.File("data/anscombe.csv") |> DataFramedf.x1df."x1" # strange, but sometimes useful df[1:4, :x1]select(df, r"x") # you can make in-place selection using the bang variant of select df## Descriptive Studydescribe(df)describe(df, :mean, :std)nrow(df), ncol(df)size(df)df.id = 1:nrow(df)dfWe want to find global minimum and maximum for X and Y separately. extrema([
    [13, 2, 5, 7] 
    [2, 4, 5, 6]
]) select(df, r"x")Matrix(select(df, r"x"))extrema(Matrix(select(df, r"x")))extrema(Matrix(select(df, r"x"))) .+ (-1, 1)xlim = collect(extrema(Matrix(select(df, r"x"))) .+ (-1, 1))
# turn them to an Array{Int64}ylim = collect(extrema(Matrix(select(df, r"y"))) .+ (-1, 1))] add PyPlot] add GLMusing PyPlotusing GLMfig, axs = plt.subplots(2, 2)
fig.tight_layout(pad=4.0)

for i in 1:4
    x = Symbol("x", i)
    y = Symbol("y", i)

    model = lm(term(y)~term(x), df)
    axs[i].plot(xlim, predict(model, DataFrame(x => xlim)), color="orange")
    axs[i].scatter(df[:, x], df[:, y])
    axs[i].set_xlim(xlim)
    axs[i].set_ylim(ylim)
    axs[i].set_xlabel("x$i")
    axs[i].set_ylabel("y$i")

    a, b = round.(coef(model), digits=2)
    c = round(100 * r2(model), digits=2)
    
    axs[i].set_title(string("R²=$c%, $y=$a+$b$x"))
endusing Plotsplot_array = Any[]

for i in 1:4    
    x_vals = df[:, "x$i"]
    y_vals = df[:, "y$i"]
    
    p = plot(
        x_vals, 
        y_vals, 
        seriestype=:scatter, 
        xlabel="x$i", 
        ylabel="y$i",
        xlims=xlim, 
        ylims=ylim, 
        smooth=true,
        opacity=0.8, 
        palette=:Dark2_5,
    ) 
    
    push!(plot_array, p)
end

plot(plot_array..., layout=(2, 2), legend=false, size=(800, 400))