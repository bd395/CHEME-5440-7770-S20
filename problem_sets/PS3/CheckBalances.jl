#include("Include.jl")

using DelimitedFiles
using LinearAlgebra

stoichMatrix = readdlm("./SM.csv")
#print(stoichMatrix)
atomMatrix = readdlm("./AM.csv")
#print(atomMatrix)
#atomMatrix = readdlm("./PS3.csv", ",")

# Check

check = transpose(atomMatrix)*stoichMatrix
print(check)
