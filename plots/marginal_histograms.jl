using Distributions
using Plots


@userplot MarginalHist

@recipe function f(h::MarginalHist)
    if length(h.args) != 2 || !(typeof(h.args[1]) <: AbstractVector) ||
        !(typeof(h.args[2]) <: AbstractVector)
        error("Marginal Histograms should be given two vectors.  Got: $(typeof(h.args))")
    end
    x, y = h.args

    # set up the subplots
    legend := false
    link := :both
    framestyle := [:none :axes :none]
    grid := false
    layout := @layout [tophist           _
                       hist2d{0.9w,0.9h} righthist]

    # main histogram2d
    @series begin
        seriestype := :histogram2d
        subplot := 2
        x, y
    end

    # these are common to both marginal histograms
    fillcolor := :black
    fillalpha := 0.3
    linealpha := 0.3
    seriestype := :histogram

    # upper histogram
    @series begin
        subplot := 1
        x
    end

    # right histogram
    @series begin
        orientation := :h
        subplot := 3
        y
    end
end


n = 1000
x = rand(Gamma(2), n)
y = -0.5x + randn(n)
marginalhist(x, y, fc = :plasma, bins = 40)
savefig("../img/marginalhist.png")