include("Include.jl")

stoichMatrix = readdlm("./PS3.csv","Stoich")
atomMatrix = readdlm("./PS3.csv", "Atom")

# Check

check = transpose(atomMatrix)*stoichMatrix
