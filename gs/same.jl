module Abb1
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
end

module Abb2
    function sconvabb(data)::Int64
        months = Dict{String, Int64}(
        "Jan" => 1,  "Feb" => 2,  "Mar" => 3,
        "Apr" => 4,  "May" => 5,  "Jun" => 6,
        "Jul" => 7,  "Aug" => 8,  "Sep" => 9,
        "Oct" => 10, "Nov" => 11, "Dec" => 12
        )
        return months[data]
    end
    function iconvabb(data)::String
        months = Dict{Int64, String}(
            1  => "Jan", 2  => "Feb", 3  => "Mar",
            4  => "Apr", 5  => "May", 6  => "Jun",
            7  => "Jul", 8  => "Aug", 9  => "Sep",
            10 => "Oct", 11 => "Nov", 12 => "Dec"
        )
        return months[data]
    end

    convabb(data::String) = sconvabb(data)
    convabb(data::Int64) = iconvabb(data)
end

module Abb3
    function convabb(data::String)::Int64
        months = Dict{String, Int64}(
        "Jan" => 1,  "Feb" => 2,  "Mar" => 3,
        "Apr" => 4,  "May" => 5,  "Jun" => 6,
        "Jul" => 7,  "Aug" => 8,  "Sep" => 9,
        "Oct" => 10, "Nov" => 11, "Dec" => 12
        )
        return months[data]
    end
    function convabb(data::Int64)::String
        months = Dict{Int64, String}(
            1  => "Jan", 2  => "Feb", 3  => "Mar",
            4  => "Apr", 5  => "May", 6  => "Jun",
            7  => "Jul", 8  => "Aug", 9  => "Sep",
            10 => "Oct", 11 => "Nov", 12 => "Dec"
        )
        return months[data]
    end
end


# Efficient: Abb1 < Abb2 < Abb3
# Perhaps making the Abb3 key a symbol would be more efficient.
using .Abb1
using .Abb2
using .Abb3

# Abb1
ca1 = Abb1.Convabb("Nov")
ca2 = Abb1.Convabb(5)
ca3 = Abb1.Convabb(8.5)
println(Abb1.convabb(ca1)) # 11
println(Abb1.convabb(ca2)) # May
# println(Abb1.convabb(ca2)) Error


# Abb2
println(Abb2.convabb("Feb")) # 2
println(Abb2.convabb(8))     # Aug


# Abb3
println(Abb3.convabb("Mar")) # 3
println(Abb3.convabb(6))     # Jun