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
myinv(3)

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
size(A)
length(A)
A[2,1]
A[2,:]
A[:,1]
A[:, 1:3]
[2*i for i in 1:5]
[i*j for i in i:3, j in 1:4]
params = (1, 2, 3)
f(a, b, c) = a + b + c
f(params...)

a = [1,2,3]
a .+ 1
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
2 * A
b = [4, 5, 6]
a + b
