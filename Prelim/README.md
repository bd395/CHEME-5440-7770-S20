### Prelim Submission

The Excel file ``Prelim_I.xlsx`` contains all answers, including graphs and qualitative responses.

Question 1 is contained within the first tab.
Accompanying Julia code (only used to calculate degradation constant) is within the Q1 folder.
For specific calculation details please refer to the cell formulas which point to the intake values.

Question 2 occupies the second tab. Accompanying Julia code is within the Q2 folder. The excel file mentions which script is used if any for each problem.


Part 2c
- ``2C_bifurcationanalysis.jl`` - bifurcation model which developed the plots: 2C_bifurcationzoomin.png and 2C_bifurcationzoomout.png 


Part 2d
- ``2DEF.jl`` - intializes acdc! function for system of ODEs, 2D code section outputted plots: 2D_S02.png, 2D_S10.png, and 2D_S1e5.png (line 46). In order to run and generate these plots, manually change S value within acdc! function and comment out rest of code below the 2D code section.


Part 2e
- ``2DEF.jl`` - intializes acdc! function for system of ODEs. 2E code section outputted plots: 2E_belowHopf.png (line 82), 2E_aboveHopf.png (line 114). In order to run and generate these plots, ensure S = p[1] in the acdc! function. Comment out 2D code section. The chosen input signals for 2e are passed to the function.


Part 2f
- ``2DEF.jl`` - intializes acdc! function for system of ODEs. In order to run and generate these plots, ensure S = p[1] in the acdc! function. Comment out 2D code section. 2F code section outputted plots: 2F_S_105_100.png (line 123), 2F_S_105ss.png (line 115). 



### Requirements

Pkg.add("``insert_package``")

For ``Bifurcations``:  ] (enter pkg mode) add https://github.com/tkf/Bifurcations.jl

``DifferentialEquations``
``Plots``
``Parameters``
``DiffEqBase``
``StaticArrays``
``Bifurcations`` 
``Setfield``
``DiffEqBase``



