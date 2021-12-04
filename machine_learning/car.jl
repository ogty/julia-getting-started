using CSV
using DataFrames
using Lathe.models
using Lathe.stats
using Lathe.preprocess: TrainTestSplit
using JLD2


df = CSV.read("../data/car data.csv", DataFrame)

train, test = TrainTestSplit(df, .75)

target = :Present_Price
feature1 = :Year
feature2 = :Kms_Driven

trainy = train[!, target]
testy = test[!, target]

trainX1 = train[!, feature1]
trainX2 = train[!, feature2]

testX1 = test[!, feature1]
testX2 = test[!, feature2]

model1 = LinearRegression(trainX1, trainy)
model2 = LinearRegression(trainX2, trainy)

yhat1 = model1.predict(testX1)
yhat2 = model2.predict(testX2)
# mae: Mean Absolute Error
println("Model one accuracy: ", mae(yhat1, testy))
println("Model tow accuracy: ", mae(yhat2, testy))
println(mean(testy))

@save "../models/mdl.jld2" model1