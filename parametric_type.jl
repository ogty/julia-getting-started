mutable struct MyCalc1{T}
    data::T
end
mutable struct MyCalc2{T1, T2}
    data1::T1
    data2::T2
end

function mysum1(mc::MyCalc1{T}) where T
    result = 0
    for i in mc.data
        result += i
    end
    return result
end
function mysum2(mc::MyCalc2{T, U}) where {T, U}
    result = 0
    for (i, j) in zip(mc.data1, mc.data2)
        result += i + j
    end
    return result
end


data1 = [1, 2, 3, 4, 5]
data2 = [1.9, 2.3, 3.8, 4.5, 5.1]

mc1 = MyCalc1(data1)
mc2 = MyCalc2(data1, data2)
mc3 = MyCalc2(data2, data1)

println(mysum1(mc1)) # 15
println(mysum2(mc2)) # 32.6
println(mysum2(mc3)) # 32.6