using CSV


iris = CSV.read("../data/iris.csv") # type: UInt8
iris = map(x -> Float64(x), iris)   # type: Float64