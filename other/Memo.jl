# Dispatch
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

println(convabb("Nov"))
println(convabb(8)) # Python: double = lambda x: [i * 2 for i in x]

double(x) = [i * 2 for i in x]
double([1, 2, 3, 4]) # Metaprogrammingusing Base.Meta


function greet()
    return "Hi"
end

func_name = "greet"
caller = "$(func_name)()"
caller = Meta.parse(caller)
call = eval(caller)
println(call)