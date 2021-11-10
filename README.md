# Julia Getting Started

[Downloads](https://julialang.org/downloads/)  
[Documentation jp](https://mnru.github.io/julia-doc-ja-v1.0/index.html)  
[Documentation en](https://docs.julialang.org/en/v1/)

***

## Package Install

```bash
$ julia install.jl
```

***

## Run in Jupyter

Setup

```bash
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