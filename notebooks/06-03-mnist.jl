# MNIST Exampleusing Random
Random.seed!(1234) # For experiment reproducibility. Can set this to any value. using Flux, Statistics 
using Flux.Data.MNIST
using Flux: onehotbatchimgs = MNIST.images()
typeof(imgs)Let's dissect that a bit ... using Plots Plots.scatter(imgs[1], size=(200, 200)) # Julia plots just 'knows' that this is suitable as an image@show size(imgs)     
@show size(imgs[1])## Loading and Encoding Labels labels = MNIST.labels()labels[1:5]@show size(labels)labels = onehotbatch(MNIST.labels(), 0:9) # convert to one-hot encoding 
labels[:, 1:5]                            # show first five labels @show size(labels)## Creating Batches and Preparing Data We can use the parition function in Julia base library to create batches. This way, we can easily manage the memory and speed trade-off. using Base.Iterators: partitionfor i in partition(1:10, 5) # create equal partitions of size 2 
    println(i)
endLet's reshape the "Gray Scale" 28x28 to a float32. That's going to take a bit of effort.imgs[1]typeof(imgs[1][1]) # this needs to be converted to float typeof(imgs)typeof(float.(imgs))imgs = convert(Array{Array{Float32, 2}, 1}, float.(imgs)) # hack needed to convert everything to Float32size(imgs[1])typeof(imgs)Let's make sure our model can handle more than one "channels" (for future proofing it.)t = (cat(imgs[1:2]..., dims=4), labels[:, 1:2])t[1]batch_size = 1000train = [(cat(imgs[i]..., dims=4), labels[:, i]) for i in partition(1:60_000, batch_size)]@show size(train)
@show length(train[1])
@show size(train[1][1])
@show size(train[1][2])## Prepare Test Datatest_images = MNIST.images(:test)[1:1000]test_images = float.(test_images)typeof(test_images)test_images = convert(Array{Array{Float32, 2}, 1}, test_images)typeof(test_images)# we have just a single batch for testing 
tX = cat(test_images..., dims=4)
tY = onehotbatch(MNIST.labels(:test)[1:1000], 0:9)@show size(tX)
@show size(tY)## The Actual CNN Model model = Chain(
  Conv((3, 3), 1 => 16, relu),
  MaxPool((2, 2)),
  Conv((3, 3), 16 => 8, relu),
  MaxPool((2, 2)),
  flatten,
  Dense(200, 10),
  softmax
)using Flux: onecold, crossentropy, throttlem = model opt = ADAM()
# opt = Descent() 
# opt = Momentum()
# opt = Nesterov()
# opt = NADAM() accuracy(x, y) = mean(onecold(m(x)) .== onecold(y)) # onecold is the inverse operation to one-hotloss(x, y) = Flux.Losses.crossentropy(m(x), y)evalcb = throttle(() -> @show(accuracy(tX, tY)), 10)Flux.train!(loss, params(m), train, opt, cb=evalcb)## Let's See Some Clean Codeusing Flux, Statistics 
using Flux.Data.MNIST
using Flux: onehotbatch
using Base.Iterators: partition
using Flux: onecold, crossentropy, throttle


function get_training_test_data(batch_size=1000) 
    # load and fix train data 
    train_labels = onehotbatch(MNIST.labels(), 0:9) 
    
    # label and imgs are combined for training 
    imgs = MNIST.images()
    imgs = convert(Array{Array{Float32, 2}, 1}, float.(imgs));    # hack needed to convert everything to Float32
    train = [(cat(imgs[i]..., dims=4), train_labels[:,i]) for i in partition(1:60_000, batch_size)]
    
    # test images and labels sent separately 
    test_imgs = MNIST.images(:test)[1:1000]
    test_imgs = convert(Array{Array{Float32, 2}, 1}, float.(test_imgs))
    test_imgs = cat(test_imgs..., dims=4)
    test_labels = onehotbatch(MNIST.labels(:test)[1:1000], 0:9)
    
    return (train, test_imgs, test_labels)
end

function build_model()
    model = Chain(
        Conv((3, 3), 1 => 16, relu),
        MaxPool((2, 2)),
        Conv((3, 3), 16 => 8, relu),
        MaxPool((2, 2)),
        flatten,
        Dense(200, 10),
        softmax
    )
end 

function train_model!(; iterations=1, opt = ADAM())
    m = build_model() 
    
    train, tX, tY = get_training_test_data()
    loss(x, y) = Flux.Losses.crossentropy(m(x), y)
    
    accuracy(x, y) = mean(onecold(m(x)) .== onecold(y))     
    evalcb = throttle(() -> @show(accuracy(tX, tY)), 10)
    
    for i in 1:iterations
        Flux.train!(loss, params(m), train, opt, cb=evalcb)
    end 
end train_model!(iterations=3, opt=ADAM())train_model!(iterations=3, opt=NADAM())train_model!(iterations=3, opt=RADAM())train_model!(iterations=3, opt=Descent())train_model!(iterations=3, opt=Descent(0.4))More optimizers and options here: https://fluxml.ai/Flux.jl/stable/training/optimisers/