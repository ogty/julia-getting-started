# Julia Getting Started

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

***

## Scraping Runtime

Julia Only
```
3.515719 seconds
2.30 M allocations: 139.313 MiB, 
1.58% gc time, 
3.04% compilation time
```

+Python
```
0.587334 seconds
199.94 k allocations: 11.887 MiB,
1.38% gc time,
4.00% compilation time
```