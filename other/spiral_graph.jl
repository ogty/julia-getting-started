include("../machine_learning/spiral.jl")

using .Spiral
using Plots

gr()x, t = load_data()
@show size(x)
@show size(t)
N = 100
CLS_NUM = 3
markers = [:circle, :utriangle, :hexagon]

for i in 0:CLS_NUM - 1
    if i == 0
        plot(x[(i * N) + 1:(i + 1) * N, 1], x[(i * N) + 1:(i + 1) * N, 2], st=:scatter, marker = markers[i + 1])
    elseif i == CLS_NUM - 1　
        display(plot!(x[(i * N) + 1:(i + 1) * N, 1], x[(i * N) + 1:(i + 1) * N, 2], st=:scatter, marker = markers[i + 1]))
    else
        plot!(x[(i * N) + 1:(i + 1) * N, 1], x[(i * N) + 1:(i + 1) * N, 2], st=:scatter, marker = markers[i + 1])
    end
end