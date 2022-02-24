# Julia Getting Started

> Walks like Python, Runs like C

--- 

**[All Packages](https://juliapackages.com/packages)**  

### Top 10 Julia Packages
1. [Flux](https://juliapackages.com/p/flux) : Machine Learning Library
2. [Pluto](https://juliapackages.com/p/pluto) : Simple reactive notebooks
3. [IJulia](https://juliapackages.com/p/ijulia) : Julia kernel for Jupyter
4. [DifferentialEquations](https://juliapackages.com/p/differentialequations) : Multi-language suite
5. [Gadfly](https://juliapackages.com/p/gadfly) : Statistical graphic
6. [Gen](https://juliapackages.com/p/gen) : A general-purpose probabilistic programming system
7. [JuMP](https://juliapackages.com/p/jump) : Modeling lanuage for Mathematical Optimization
8. [Knet](https://juliapackages.com/p/knet) : Deep Learning framework
9. [Plots](https://juliapackages.com/p/plots) : Visualizations and data analysis
10. [Mocha](https://juliapackages.com/p/mocha) : Deep Learning framework

[Downloads](https://julialang.org/downloads/)  
[Documentation jp](https://mnru.github.io/julia-doc-ja-v1.0/index.html)  
[Documentation en](https://docs.julialang.org/en/v1/)  
[Unicode Mathematical Operators](http://www.asahi-net.or.jp/~ax2s-kmtn/ref/unicode/u2200.html)

***

## Package Install

```bash
$ julia install.jl
```

***

## Run in Jupyter

Setup

```julia-repl
$ julia
julia> ]
(@v1.x) pkg> add IJulia
(@v1.x) pkg> # press backspace
julia> using IJulia
julia> notebook()
```

Run

```
$ jupyter notebook
```
