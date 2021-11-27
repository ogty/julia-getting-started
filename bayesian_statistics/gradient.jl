using PyPlot


L = 10

XS1 = range(-1, 1, length=L)
XS2 = range(-1, 1, length=L)

f(x) = -(x .+ 1)'*(x .- 1)
deltaf(x) = -2x

fig, axes = subplots(1, 2, figsize=(8, 4))

cs = axes[1].contour(XS1, XS2, [f([X1, X2]) for X1 in XS1, X2 in XS2])
axes[1].clabel(cs, inline=true)
axes[1].set_xlabel("X1"), axes[1].set_ylabel("X2")
axes[1].set_title("f2(x)")

vec1 = [deltaf([X1, X2])[1] for X1 in XS1, X2 in XS2]
vec2 = [deltaf([X1, X2])[2] for X1 in XS1, X2 in XS2]
axes[2].quiver(repeat(XS1, 1, L), repeat(XS2', L, 1), vec1, vec2)
axes[2].set_xlabel("X1"), axes[2].set_ylabel("X2")
axes[2].set_title("deltaf(x)")

tight_layout()
savefig("../img/gradient.png")