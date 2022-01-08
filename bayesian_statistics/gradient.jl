using PyPlot


L = 10

XS₁ = range(-1, 1, length=L)
XS₂ = range(-1, 1, length=L)

f₂(x) = -(x .+ 1)'*(x .- 1)
∇f₂(x) = -2x

fig, axes = subplots(1, 2, figsize=(8, 4))

cs = axes[1].contour(XS₁, XS₂, [f₂([X₁, X₂]) for X₁ in XS₁, X₂ in XS₂])
axes[1].clabel(cs, inline=true)
axes[1].set_xlabel("X₁"), axes[1].set_ylabel("X₂")
axes[1].set_title("f₂(x)")

vec1 = [∇f₂([X₁, X₂])[1] for X₁ in XS₁, X₂ in XS₂]
vec2 = [∇f₂([X₁, X₂])[2] for X₁ in XS₁, X₂ in XS₂]

axes[2].quiver(repeat(XS₁, 1, L), repeat(XS₂', L, 1), vec1, vec2)
axes[2].set_xlabel("X₁"), axes[2].set_ylabel("X₂")
axes[2].set_title("∇f₂(x)")

tight_layout()
savefig("../img/gradient.png")