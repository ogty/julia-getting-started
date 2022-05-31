module MySeries
    export Calc
    export Convabb
    export convabb

    mutable struct Convabb{T}
        data::T
    end

    function convabb(ca::Convabb{String})::Int64
        months = Dict{String, Int64}(
        "Jan" => 1,  "Feb" => 2,  "Mar" => 3,
        "Apr" => 4,  "May" => 5,  "Jun" => 6,
        "Jul" => 7,  "Aug" => 8,  "Sep" => 9,
        "Oct" => 10, "Nov" => 11, "Dec" => 12
        )
    
        return months[ca.data]
    end

    function convabb(ca::Convabb{Int64})::String
        months = Dict{Int64, String}(
            1  => "Jan", 2  => "Feb", 3  => "Mar",
            4  => "Apr", 5  => "May", 6  => "Jun",
            7  => "Jul", 8  => "Aug", 9  => "Sep",
            10 => "Oct", 11 => "Nov", 12 => "Dec"
        )
        return months[ca.data]
    end
    
    function convabb(ca::Convabb)
        throw("Error")
    end

    module Calc
        export mysum

        function mysum(data::Vector{Int64})::Int64
            result = 0
            for i in data
                result += i
            end
            return result
        end

        function mymean(data::Vector{Int64})::Float64
            return MyCalc.mysum(data) / length(data)
        end
    end
end


using .MySeries

ca = Convabb("Nov")
println(convabb(ca))
println(Calc.mysum([1, 2, 3, 4, 5]))