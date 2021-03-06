### Element balance check
To check if the chemical reactions are balanced, issue the command:

  ```jl
    julia > include("CheckBalances.jl")
  ```
This will use the stoichiometric matrix (18x21) stored in ``Stoich_Matrix.csv`` and atom matrix (18x5) stored in ``Atom_Matrix`` and then compute the product of ``transpose(Atom_Matrix)*Stoich_Matrix``. 

This product gives a 5x21 matrix of which the first six columns are all zeros. This indicates that the elements (C, H, O, N, P, S) balance. 

### Estimate urea flux
To estimate the Urea flux, issue the command:

  ```jl
    julia > include("Solve.jl")
  ```
The ``Solve.jl`` script formulates the constraints into a [Julia Dictionary](https://docs.julialang.org/en/v1/base/collections/#Dictionaries-1) which is passed to the solver code contained in the ``Flux.jl`` file.

The solver returns the ``objective_value`` and ``flux_array`` arguments which are the the Urea flux and
the optimal flux distribution, respectively. 

The optimal flux calculated is approximately: 1.24 mmol/gDW-hr.
This solution is printed when the ``Solve.jl`` script is executed.

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


