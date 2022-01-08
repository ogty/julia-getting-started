using Flux, Statistics 
using Flux.Data.MNIST
using Flux: onehotbatch
using Base.Iterators: partition
using Flux: onecold, crossentropy, throttle
using BSON: @save
using BSON: @load
using Dates: now


train, tX, tY = get_training_test_data()

@load "saves/mymodel-01.bson" model

loss(x, y) = Flux.Losses.crossentropy(model(x), y)
opt = ADAM()

accuracy(x, y) = mean(onecold(model(x)) .== onecold(y))     
evalcb = throttle(() -> @show(accuracy(tX, tY)), 10)

Flux.train!(loss, params(model), train, opt, cb=evalcb) # as you can see, model has resumed training 

# evalcb = throttle(() -> @show(accuracy(tX, tY)), 10); # let's rewrite this for multi-line function 
evalcb_checkpoints = throttle(10) do 
    @show accuracy(tX, tY)
    @save "saves/model-checkpoint-$(now()).bson" model
end

Flux.train!(loss, params(model), train, opt, cb=evalcb_checkpoints)