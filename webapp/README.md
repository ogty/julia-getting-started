[Tutorial](https://genieframework.github.io/Genie.jl/dev/tutorials/3--Getting_Started.html)

***

**Create Project**
```julia
$ julia
julia> ]
(@v1.x) pkg> add Genie
(@v1.x) pkg> # press backspace
julia> using Genie
julia> Genie.newapp_webservice("App_name")
```

**Run**

```bash
$ cd App_name
$ cd bin
$ source server
```