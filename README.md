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
3.578908 seconds
2.34 M allocations: 141.620 MiB, 
1.06% gc time, 
3.30% compilation time
```

+Python
```
0.587334 seconds
199.94 k allocations: 11.887 MiB,
1.38% gc time,
4.00% compilation time
```