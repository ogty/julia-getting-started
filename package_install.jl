packages = open("./requirements.txt")
packages = readlines(packages)

using Pkg; Pkg.add(packages)