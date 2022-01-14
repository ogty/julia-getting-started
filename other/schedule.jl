# example
nine_two = "09:02"                     # split
hour, minute = split(nine_two, ":")    # convert integer
hour_int = parse(Int64, hour)          # length
hour_length = length(string(hour_int)) # for

for i in 0:10:59
    println(i)
end

function schedule(first::Int64, last::Int64, step::Int64)
    result = []
    for hour in first:last
        for minute in 0:step:59
            tmp_hour = ""
            tmp_minute = ""
            if hour < 10
                tmp_hour = "0" * string(hour)
            else
                tmp_hour = string(hour)
            end
            if minute < 10
                tmp_minute = "0" * string(minute)
            else
                tmp_minute = string(minute)
            end

            # println(string(tmp_hour) * ":" * string(tmp_minute))
            push!(result, string(tmp_hour) * ":" * string(tmp_minute))
        end
    end
    return result
end

println(schedule(9, 15, 5))