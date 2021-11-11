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
