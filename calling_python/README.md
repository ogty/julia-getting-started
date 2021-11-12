## Calling Python

Setup

```bash
$ julia
julia> ]
(@v1.x) pkg> add PyCall
(@v1.x) pkg> # press backspace
julia> using Pkg
julia> Pkg.build("PyCall")
```

If your environment is Anaconda

```bash
$ julia
julia> ]
(@v1.x) pkg> add Conda
(@v1.x) pkg> # press backspace
julia> using Conda
julia> Conda.add("Python Library name")
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