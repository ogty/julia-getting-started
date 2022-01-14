# Multi-Layer Perceptrons using Flux# Layer 1: weights, bias and forward pass 

W1 = rand(3, 5) # 3 nodes, 5 values coming in to each node 
b1 = rand(3)    # each node has its own bias term 

layer1(x) = W1 * x .+ b1σ(0), σ(1), σ(-1) # typical sigmoid function, just for demo # activation for layer 1 
l1(x) = σ.(layer1(x))# Layer 2
W2 = rand(2, 3) # 2 nodes, 3 values coming in to each node (because L1 had 3)
b2 = rand(2) 

layer2(x) = W2 * x .+ b2# combine to form a model with linear activation 
model(x) = layer2(l1(x))      model(rand(5)) # at this point, we can write a loss function as before but ... This makes the prediction but it's quickly going to get ugly. So, let's clean this up a bit. ## Cleaning Up the Code ### Layer types function linear(in, out)
  W = randn(out, in)
  b = randn(out)
  x -> W * x .+ b # returns a function that takes in a vector and produces another 
endlinear(5, 3)  # 5 nodes coming in, 3 in current layer linear1 = linear(5, 3) 
linear2 = linear(3, 2)linear1.W # these are perfectly visible (it's a closure, in case you're interested)model(x) = linear2(σ.(linear1(x)))x = rand(5) model(x)# or even make it more readable with pipes 
model_p(x) = σ.(linear1(x)) |> linear2 
        model_p(x)That is almost the same as the built-in layers in Flux. Let's start using them from now on. ## Layers in Flux Let's restart the kernel first because we defined it as a function above. using Flux layer1 = Dense(10, 5, σ)model2 = Chain(
  Dense(10, 5, σ), # input shape is (10, ), nodes are 5 
  Dense(5, 2),
  softmax)         # builtin softmax model2(rand(10))  