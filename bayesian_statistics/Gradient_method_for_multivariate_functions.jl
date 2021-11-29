using PyPlot
using Distributions


x_opt = [0.50, 0.25]
f₂(x) = -sqrt(0.05 + (x[1] - x_opt[1])^2) - (x[2] - x_opt[2])^2

L = 100
XS₁ = range(-1, 1, length=L)
XS₂ = range(-1, 1, length=L)
fig, ax = subplots()
ax.contour(XS₁, XS₂, [f₂([X₁, X₂]) for X₁ in XS₁, X₂ in XS₂]')
ax.plot(x_opt[1], x_opt[2], color="r", marker="x", label="optimal")
ax.set_xlabel("x₁"), ax.set_ylabel("x₂")
ax.grid()
ax.legend()
savefig("../img/gradient_multi.png")