using DataFrames
using CSV
using PyPlot
using GLM


# Calling a column: df.x1 or df."x1"
# df[1:4, :x1] : slice range, simbol(column name)
df = CSV.File("../data/anscombe.csv") |> DataFrame


# Efficient Calling
println(select(df, r"x")) # dataframe, column name prefix 
"""
 Row │ x1     x2     x3     x4    
     │ Int64  Int64  Int64  Int64 
─────┼────────────────────────────
   1 │    10     10     10      8 
   2 │     8      8      8      8 
   3 │    13     13     13      8 
   4 │     9      9      9      8 
   5 │    11     11     11      8 
   6 │    14     14     14      8 
   7 │     6      6      6      8 
   8 │     4      4      4     19 
   9 │    12     12     12      8 
  10 │     7      7      7      8 
  11 │     5      5      5      8 
"""

# Show basic statistics
println(describe(df))              # all
println(describe(df, :mean, :std)) # select
"""
 Row │ variable  mean     min   median   max    nmissing  eltype   
     │ Symbol    Float64  Real  Float64  Real   Int64     DataType 
─────┼─────────────────────────────────────────────────────────────
   1 │ x1        9.0         4     9.0      14         0  Int64    
   2 │ x2        9.0         4     9.0      14         0  Int64    
   3 │ x3        9.0         4     9.0      14         0  Int64    
   4 │ x4        9.0         8     8.0      19         0  Int64    
   5 │ y1        7.50091  4.26     7.58  10.84         0  Float64  
   6 │ y2        7.50091   3.1     8.14   9.26         0  Float64  
   7 │ y3        7.5      5.39     7.11  12.74         0  Float64  
   8 │ y4        7.50091  5.25     7.04   12.5         0  Float64 

 Row │ variable  mean     std     
     │ Symbol    Float64  Float64 
─────┼────────────────────────────
   1 │ x1        9.0      3.31662 
   2 │ x2        9.0      3.31662 
   3 │ x3        9.0      3.31662
   4 │ x4        9.0      3.31662
   5 │ y1        7.50091  2.03157
   6 │ y2        7.50091  2.03166
   7 │ y3        7.5      2.03042
   8 │ y4        7.50091  2.03058
"""

# size 
println(nrow(df), ncol(df)) # (11, 8)
println(size(df))           # (11, 8) : line, column


# add column
df.id = 1:nrow(df)


xlim = collect(extrema(Matrix(select(df, r"x")))  .+ (-1, 1))
ylim = collect(extrema(Matrix(select(df, r"y")))  .+ (-1, 1))

fig, axs = plt.subplots(2, 2)
fig.tight_layout(pad=4.0)
for i in 1:4
    x = Symbol("x", i)
    y = Symbol("y", i)
    model = lm(term(y) ~ term(x), df)
    axs[i].plot(xlim, predict(model, DataFrame(x => xlim)), color="orange")
    axs[i].scatter(df[:, x], df[:, y])
    axs[i].set_xlim(xlim)
    axs[i].set_ylim(ylim)
    axs[i].set_xlabel("x$i")
    axs[i].set_ylabel("y$i")
    a, b = round.(coef(model), digits=2)
    c = round(100 * r2(model), digits=2)
    axs[i].set_title(string("R²=$c%, $y=$a+$b$x"))
end

fig.savefig("../img/graph_1.png")