[Tutorial](https://genieframework.github.io/Genie.jl/dev/tutorials/3--Getting_Started.html)

***

**Create Project**
```julia
$ julia
julia> ]
(@v1.x) pkg> add Genie
(@v1.x) pkg> # press backspace
julia> using Genie
julia> Genie.newapp_webservice("ProjectName")
```

```
ProjectName
├── Manifest.toml
├── Project.toml
├── bin
├── bootstrap.jl
├── config
├── genie.jl
├── log
├── public
├── routes.jl
└── src
```

**Run**

```bash
$ cd ProjectName
$ cd bin
$ source server
```