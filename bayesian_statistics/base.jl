x = 3
y = 1.2
z = "Hi!"

typeof(x)
typeof(y)
typeof(z)

x + 1

μ = 0.0
σ = 2.0
xᵢ = 0
σ² = σ^2

x = 1.0
y = 2.0
if x < y
    println("x is less than y.")
elseif x == y
    println("x is equal to y.")
else
    println("x is greater than y.")
end

x = -3
y = x < 0 ? "T" : "F"
println(y)

a = 0
b = 0
true && (a = 1)
true || (b = 1)
println("a=$(a), b=$(b)")

for i in 1:10
    println(i)
end

myinv(x) = 1/x
println(myinv(3))

function myinv(x)
    return 1/x
end

function mymean(x, y)
    return (x+y)/2
end
mymean(1.0, 2.0)

a = [1, 2, 3]
b = [1 2 3]
c = Array{Float64}(undef, 3)
d = zeros(3)
e = ones(3)
f = rand(3)
g = randn(3)
A = [1 2 3 4;
     5 6 7 8]
B = ones(2, 4)
println(size(A))
println(length(A))

println(A[2,1]
println(A[2,:]
println(A[:,1])
println(A[:, 1:3])

println([2*i for i in 1:5])
println([i*j for i in i:3, j in 1:4]

params = (1, 2, 3)

f(a, b, c) = a + b + c
f(params...)

a = [1,2,3]
println(a .+ 1)
function add_one(x)
    x + 1
end
add_one(1.0)

add_one.([1,2,3])
x -> x + 1
map(x -> x + 1, [1,2,3])
function test(maxiter)
    a = []
    for i in 1:maxiter
        push!(a, rand())
    end
    sum(a)
end
@time test(100000)

mean([1,2,3,4,5])
using Pkg
Pkg.add("Statistics")

using Statistics
mean([1,2,3,4,5])

using PyPlot
Y1 = [1,7,11,13,15,16]
Y2 = [15,3,13,2,7,1]

fig, ax = subplots()
ax.plot(Y1)
ax.plot(Y2)

ax.set_xlabel("index")
ax.set_ylabel("Y")

ax.set_title("my graph")

fig, axes = subplots(1, 2, figsize=(10,3))
axes[1].plot(Y1)
axes[2].plot(Y2)
f(x) = x^2

xs = range(-3, 3, length=10)
fig, ax = subplots()
ax.plot(xs, f.(xs), "-")

ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("y=x^2")

f(x) = x^2
xs = range(-3, 3, length=100)
fig, ax = subplots()
ax.plot(xs, f.(xs), "-")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("y=x^2")

r = 1.0
fx(θ) = r*(θ-sin(θ))
fy(θ) = r*(θ-cos(θ))
θs = range(-3pi, 3pi, length=100)

fig, ax = subplots()
ax.plot(fx.(θs), fy.(θs))
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("cycloid")

sig(x) = 1 \ (1 + exp(-x))
xs = range(-5, 5, length=100)
ax.plot(xs, sig.(xs))
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("sigmoid")

X = randn(1000)
Y = rand(1000)

fig, ax = subplots()

ax.scatter(X, Y)

ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("scatter")

X = randn(1000)
fig, ax = subplots()
ax.hist(X)

fig, ax = subplots()
ax.hist(X, bins=50)

fz(x, y) = exp(-(2x^2+y^2+x*y))
xs = range(-1, 1, length=100)
ys = range(-2, 2, length=100)

fig, axes = subplots(1, 2, figsize=(8, 4))
cs = axes[1].contour(xs, ys, fz.(xs', ys))
axes[1].clabel(cs, inline=true)

cs = axes[2]/contourf(xs, ys, fz.(xs', ys))
fig.colorbar(cs)

tight_layout()


a = [1, 2, 3]
println(2 * A)
b = [4, 5, 6]
println(a + b)

println(a .*b)
sum(a .* b)
println(a' * b)

A = [1 2 3;
     4 5 6]
B = [10 20 30;
     40 50 60]
println(A + B)

A = [1 2;
     3 4;
     5 6]
B = [10 20 30 40;
     50 60 70 80]
C = A + B

M = size(A, 1)
N = size(B, 2)

C = [sum(A[i,:] .* B[:,j]) for i in 1:M, j in 1:N]

println(B * A)

A = [1 2;
     3 4;
     5 6]
I = [1 0 0;
     0 1 0;
     0 0 1]
println(I * A)

A = [1 2 3;
     4 5 6]
println(A')

a = [1, 2, 3]
b = [5, 6]
println(a * b')

f2(x, y) = 2*x + y
f2.(a, b')

A = [1 2;
     3 4]
B = inv(A)

println(A * B)

println(B * A)

println(B)
A = Rational{Int}[1 2;
                  3 4]
B = inv(A)
println(A * B)
println(B * A)

A = Rational{Int}[1 2;
                  3 4]
sol = inv(A) * [-1, 1]

using Statistics

X = rand(5)
Y = rand(2, 5)

println(sum(X))
println(mean(X))

print(sum(Y))
print(sum(Y, dims=1))
print(sum(Y, dims=2))
print(mean(Y))
print(mean(Y, dims=1))
print(mean(Y, dims=2))

print(std(X))
print(std(X).^2)
print(var(X))

cov(Y, dims=1)
cov(Y, dims=2)

using Distributions

μ = 1.5
σ = 2.0
Z = rand(Normal(μ, σ), 10000)
pritnln(Z)

println(mean(Z))
print(std(Z))

using PyPlot

f(x) = -(x + 1)*(x - 1)
h = 1.0e-10
f'(a) = (f(a + h) - f(a)) / h
xs = range(-1, 1, length=100)
fig, axes = subplots(2, 1, figsize=(4, 6))

axes[1].plot(xs, f.(xs), "b")
axes[1].grid()
axes[1].set_xlabel("x")
axes[1].set_ylabel("y")
axes[1].set_title("function f(x)")

axes[2].plot(xs, f.(xs), "r")
axes[2].grid()
axes[2].set_xlabel("x")
axes[2].set_ylabel("y")
axes[2].set_title("derivative f'(x)")

tight_layout()

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

using ForwardDiff

f(x) = -(x + 1)*(x - 1)

f'(x) = ForwardDiff.derivative(f, x)
xs = range(-1, 1, length=100)

fig, axes = subpots(2, 1, figsize(4, 6))

axes[1].plot(xs, f.(xs), "b")
axes[1].grid()
axes[1].set_xlabel("x")
axes[1].set_ylabel("y")
axes[1].set_title("function f(x)")

axes[2].plot(xs, f'.(xs), "r")
axes[2].grid()
axes[2].set_xlabel("x")
axes[2].set_ylabel("y")
axes[2].set_title("derivative f'(x)")

tight_layout()