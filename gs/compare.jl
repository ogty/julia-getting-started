"""
class MyCalc:
    def __init__(self, data):
        self.data = data
    def mysum(self):
        result = 0
        for i in self.data:
            result += i
        return result

data = [1, 2, 3, 4, 5]
mycalc = MyCalc(data)

print(mycalc.mysum()) # 15
"""

function MyCalc(data)
    Result = []

    function mysum()
        result = 0
        for i in data
            result += i
        end
        return result
    end
    function mymax()
        result = data[1]
        for i in data
            if i > result
                result = i
            end
        end
        return result
    end
    function mymin()
        result = data[1]
        for i in data
            if i < result
                result = i
            end
        end
        return result
    end
    function mymean()
        result = mysum() / length(data)
        return result
    end
    function addall()
        push!(Result, mysum())
        push!(Result, mymax())
        push!(Result, mymin())
        push!(Result, mymean())
        return Result
    end
    function refer()
        return Result
    end  

    () -> (data; (mysum, mymax, mymin, mymean, addall, refer))
end

data = [1, 2, 3, 4, 5]
mycalc = MyCalc(data)

println(mycalc.mysum())  # 15
println(mycalc.mymax())  # 5
println(mycalc.mymin())  # 1
println(mycalc.mymean()) # 3.0
println(mycalc.addall()) # [15, 5, 1, 3.0]
println(mycalc.refer())  # [15, 5, 1, 3.0]