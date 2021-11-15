# Julia Original Validator

 - Networks
   - @HttpUrl
   - @IPv4Address
   - HttpUrl
   - IPv4Address

***

### Example docstring

```julia-repl
$ julia
julia> include("./validator.jl")
julia> using .Representation
julia> # press "?"
help?> @HttpUrl
  @HttpUrl

  This HttpUrl macro returns a boolean value as an argument, but the HttpUrl function returns the result of parsing the URL.

  Examples
  ≡≡≡≡≡≡≡≡≡≡

  julia> url1 = "https://example.com/"
  
  julia> url2 = "/support"
  
  julia> @HttpUrl url1
      true
  
  julia> @HttpUrl url2
      ERROR: ValidationError
```