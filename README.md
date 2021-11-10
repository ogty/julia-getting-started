# Julia Getting Started

### Package Install

```bash
$ julia package_install.jl
```

***

### IF Sentence

```julia
osbit = Sys.WORD_SIZE

if osbit == 64
    println("Hello 64bit user!")
elseif osbit == 32
    println("Hello 32bit user!")
else
    println("Who are you?")
end
```