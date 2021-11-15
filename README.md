# Julia Getting Started

> Walks like Python, Runs like C

**[All Packages](https://juliapackages.com/packages)**  

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

```julia
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