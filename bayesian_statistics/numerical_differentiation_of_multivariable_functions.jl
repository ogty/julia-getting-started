using PyPlot


D = 2
A = [0.5 0.3
     0.3 1.0]

f₂(x) = exp(-0.5 * x' * A * x)

L = 20
xs₁ = range(-5, 5, length=L)
xs₂ = range(-5, 5, length=L)

fig, axes = subplots(1, 2, figsize=(8, 4))

cs = axes[1].contour(repeat(xs₁, 1, L), repeat(xs₂', L, 1), [f₂([x₁, x₂]) for x₁ in xs₁, x₂ in xs₂]')
axes[1].clabel(cs)
axes[1].grid()
axes[1].set_xlabel("x₁"), axes[1].set_ylabel("x₂")

cs = axes[2].imshow([f₂([x₁, x₂]) for x₁ in xs₁, x₂ in xs₂], origin="lower")

fig.colorbar(cs)
axes[2].set_xlabel("x₁"), axes[2].set_ylabel("x₂")

tight_layout()
savefig("../img/differentiation_multi.png")