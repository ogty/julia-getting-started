result = map([-10, 0, 20]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end

print(result) # [0, 1, 20]