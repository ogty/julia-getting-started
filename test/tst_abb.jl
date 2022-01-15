using Test
include("abb.jl")
using .Abb

@testset "Abb" begin
    @test Abb.convabb("Mar") == 3
    @test Abb.convabb(6) == "Jun"
end
