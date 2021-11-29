using PyPlot
using Distributions
using ForwardDiff


function gradient_method_1dim(f, x_init, η, maxiter)
    fx(x) = ForwardDiff.derivative(f, x)
    
    x_seq = Array{typeof(x_init), 1}(undef, maxiter)
    x_seq[1] = x_init
    
    for i in 2:maxiter
        x_seq[i] = x_seq[i - 1] + η * fx(x_seq[i - 1])
    end
  
    return x_seq
end

f_complex(x) = 0.3 * cos(3pi * x) - x^2

maxiter = 20
η = 0.01

x_init_a = -0.8
x_seq_a = gradient_method_1dim(f_complex, x_init_a, η, maxiter)
f_seq_a = f_complex.(x_seq_a)

x_init_b = 0.25
x_seq_b = gradient_method_1dim(f_complex, x_init_b, η, maxiter)
f_seq_b = f_complex.(x_seq_b)

fig, axes = subplots(2, 1, figsize=(8, 4))
axes[1].plot(f_seq_a)
axes[1].set_xlabel("iteration"), axes[1].set_ylabel("f")
axes[1].set_title("f(x) (a)")
axes[1].grid()
axes[2].plot(f_seq_b)
axes[2].set_xlabel("iteration"), axes[2].set_ylabel("f")
axes[2].set_title("f(x) (b)")
axes[2].grid()

tight_layout()
savefig("../img/optimal_solutions_1.png")


xs = range(-1, 1, length=100)

fig, axes = subplots(1, 2, figsize=(12, 4))

axes[1].plot(xs, f_complex.(xs), label="f_complex")
axes[1].plot(x_seq_a, f_complex.(x_seq_a), color="b", marker="x", label="x sequence")
axes[1].set_xlabel("x"), axes[1].set_ylabel("y")
axes[1].grid()
axes[1].set_title("initial value a")
axes[1].legend()

axes[2].plot(xs, f_complex.(xs), label="f_complex")
axes[2].plot(x_seq_b, f_complex.(x_seq_b), color="b", marker="x", label="x sequence")
axes[2].set_xlabel("x"), axes[2].set_ylabel("y")
axes[2].grid()
axes[2].set_title("initial value b")
axes[2].legend()

tight_layout()
savefig("../img/optimal_solutions_2.png")