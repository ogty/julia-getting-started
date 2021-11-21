using Flux


W = rand(2, 5)
b = rand(2)
 
predict(x) = W*x .+ b
 
function loss(x, y)
    ŷ = predict(x)
    sum((y .- ŷ).^2)
end
 
x, y = rand(5), rand(2)
 
println("x = $(x)")
println("y = $(y)")
println("ŷ = $(predict(x))")
println("loss = $(loss(x, y))")
# x = [0.6528859725483531, 0.6733414993055367, 0.5884290598325193, 0.6966314209130706, 0.525184458681561]
# y = [0.0690108409782475, 0.7554432225223775]
# ŷ = [2.442030286310581, 1.0295284222165977]
# loss = 5.706343984616796