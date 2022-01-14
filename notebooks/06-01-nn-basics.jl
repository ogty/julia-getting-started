# Neural Networks with Flux Flux is a very popular package in Julia for machine learning. 

Personally, I think it's the best of both worlds with the speed of tensorflow and the nice interface provided by Keras. You can read more about it here: https://fluxml.ai/Flux.jl/stable/ ] add Fluxusing Flux ## Bare-bones (Core) Flux f(x) = 3x^2 + 2x + 1; # gradient 6x+2gradient(f, 2)df(x) = gradient(f, x)[1]df(2)## Multiple Params for Functions f(x, y) = sum((x .- y) .^ 2); # we'll pass it vectors w = [2, 1]
b = [2, 0];

gradient(f, w, b) # two vectors need to be given gs = gradient(params(w, b)) do # for these param values 
        f(w, b)                # calculate gradient of 
     endgs.gradsgs[w]gs[b]## Basic Model for Flux W = rand(2, 5) # Weights
b = rand(2)    # biases predict(x) = W*x .+ b # forward pass, uses global scope W and b function loss(x, y)
  ŷ = predict(x) # write as y\hat [tab]
  sum((y .- ŷ).^2)
endx, y = rand(5), rand(2) # Dummy dataloss(x, y) # note the value here gs = gradient(params(W, b)) do # derivative with respect to W and b
        loss(x, y)             # for this function 
     end # We can write the above more precisely as: 
gs = gradient(() -> loss(x, y), params(W, b))gs.gradsW̄ = gs[W] # \bar # Let's update weights based on these gradients W .-= 0.1 .* W̄loss(x, y) # loss decreases (of course)# We can also update the bias terms 
b̄ = gs[b]
b .-= 0.1 .* b̄loss(x, y) # even better That was a very simple single layer neural network (or perceptron) in just a few minutes from scratch. This is very similar to tensorflow but without all the messy bits. Let's build on this to get a few more layers in. W = rand(2, 5) # Weights
b = rand(2)    # biases 

predict(x) = W*x .+ b  

function loss(x, y)
  ŷ = predict(x) # write as y\hat [tab]
  sum((y .- ŷ).^2)
end

x, y = rand(5), rand(2) # Dummy data
loss(x, y) gs = gradient(() -> loss(x, y), params(W, b))
W̄ = gs[W] 
W .-= 0.1 .* W̄

b̄ = gs[b]

b .-= 0.1 .* b̄
loss(x, y) 