using GraphPlot
using SimpleWeightedGraphs
using LinearAlgebra
using DataFrames
using Random
using CSV
using Colors
using Cairo
using Compose


Random.seed!(7)
df = DataFrame(rand([0, 1], 10, 20));

g = SimpleWeightedGraph(ncol(df))

GraphPlot.add_edge!(g, 1, 2, 2)

ew = Int[]
for i in 1:ncol(df), j in i+1:ncol(df) # iterate over all combinations of columns
    w = dot(df[!, i], df[!, j])        # calculate how many times (i,j) occurs
    if w > 0
        push!(ew, w)
        GraphPlot.add_edge!(g, i, j, w)
    end
end

draw(PNG("../img/lesson_1_1.png", 16cm, 16cm), gplot(g, nodelabel=names(df), edgelinewidth=ew))
draw(PNG("../img/lesson_1_2.png", 16cm, 16cm), gplot(g, nodelabel=names(df), edgelinewidth=ew, layout=circular_layout))


centrality = GraphPlot.betweenness_centrality(g, normalize=false).+1
alphas = centrality./maximum(centrality).*10
nodefillc = [RGBA(0.0, 0.8, 0.8, i) for i in alphas]
draw(PNG("../img/lesson_1_3.png", 16cm, 16cm), gplot(g, nodelabel=names(df), edgelinewidth=ew, nodefillc=nodefillc))


g_mst = SimpleWeightedGraph(ncol(df))
for i in GraphPlot.kruskal_mst(g, minimize=false)
    GraphPlot.add_edge!(g_mst, i.src, i.dst, i.weight)
end
draw(PNG("../img/lesson_1_4.png", 16cm, 16cm), gplot(g_mst, nodelabel=names(df)))
