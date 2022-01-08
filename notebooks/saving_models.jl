using Flux, Statistics 
using Flux.Data.MNIST
using Flux: onehotbatch
using Base.Iterators: partition
using Flux: onecold, crossentropy, throttle
using BSON: @save
using BSON: @load
using Dates: now


function get_training_test_data(batch_size=1000) 
    # load and fix train data 
    train_labels = onehotbatch(MNIST.labels(), 0:9) 
    
    # label and imgs are combined for training 
    imgs = MNIST.images()
    imgs = convert(Array{Array{Float32, 2}, 1}, float.(imgs)) # hack needed to convert everything to Float32
    train = [(cat(imgs[i]..., dims=4), train_labels[:, i]) for i in partition(1:60_000, batch_size)]
    
    # test images and labels sent separately 
    test_imgs = MNIST.images(:test)[1:1000]
    test_imgs = convert(Array{Array{Float32, 2}, 1}, float.(test_imgs))
    test_imgs = cat(test_imgs..., dims=4)
    test_labels = onehotbatch(MNIST.labels(:test)[1:1000], 0:9)
    
    return (train, test_imgs, test_labels)
end

model = Chain(
    Conv((3, 3), 1 => 16, relu),
    MaxPool((2, 2)),
    Conv((3, 3), 16 => 8, relu),
    MaxPool((2, 2)),
    flatten,
    Dense(200, 10),
    softmax
)

train, tX, tY = get_training_test_data()

loss(x, y) = Flux.Losses.crossentropy(model(x), y)
opt = ADAM()

accuracy(x, y) = mean(onecold(model(x)) .== onecold(y))     
evalcb = throttle(() -> @show(accuracy(tX, tY)), 10)

Flux.train!(loss, params(model), train, opt, cb = evalcb)

mkdir("saves")
@save "saves/mymodel-01.bson" model
