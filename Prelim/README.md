### Prelim Submission

The Excel file ``Prelim_I.xlsx`` contains all answers, including graphs and qualitative responses.



### Requirements

The ``CheckBalances.jl`` script requires the ``CSV``, ``LinearAlgebra``, and ``DataFrames`` Julia packages.

The ``Solve.jl`` solution script requires the ``GLPK`` package to the FBA problem. See [GLPK]
(https://github.com/JuliaOpt/GLPK.jl) for details.


### File Directory
``Atom_Matrix.csv``: atom matrix taken from PS3.csv
``CheckBalances.csv``: checks that elements balance
``DataDictionary.jl``: returns correct bounds for optimization
``Flux.jl``: uses GLPK optimization package for max urea flux calculation
``Include.jl``: includes required packages
``PS3.csv``: more user-friendly visual of stoichiometric and atom matrices
``Solve.jl``: executes optimization and prints out the max urea flux
``Stoich_Matrix.csv``: stoichiometric matrix taken from PS3.csv
``Stoich_Matrix.dat``: stoichiometric matrix in .dat form


