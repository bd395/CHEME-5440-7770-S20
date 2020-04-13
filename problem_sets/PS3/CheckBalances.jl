#include("Include.jl")

using DelimitedFiles
using LinearAlgebra
using CSV
using DataFrames



SM = DataFrame(CSV.File("SM.csv",header=false))
SM = convert(Matrix,SM)


writedlm("Stoich_Matrix.dat", SM)

AM = DataFrame(CSV.File("AM.csv",header=false))
AM = convert(Matrix,AM)

check = transpose(AM)*SM
