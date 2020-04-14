#include("Include.jl")

using DelimitedFiles
using LinearAlgebra
using CSV
using DataFrames



Stoich_Matrix = DataFrame(CSV.File("Stoich_Matrix.csv",header=false))
Stoich_Matrix = convert(Matrix,Stoich_Matrix)
writedlm("Stoich_Matrix.dat", Stoich_Matrix)

Atom_Matrix = DataFrame(CSV.File("Atom_Matrix.csvM.csv",header=false))
Atom_Matrix = convert(Matrix,Atom_Matrix)

check = transpose(Atom_Matrix)*Stoich_Matrix
