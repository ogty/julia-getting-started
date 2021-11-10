result = map([-10, 0, 20]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end

println(result) # [0, 1, 20]



f(x,y) = 3x + 4y;
A = [1.0, 2.0, 3.0];
B = [4.0, 5.0, 6.0];
println(f.(A, B))
println(f(A, B))
