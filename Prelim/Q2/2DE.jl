using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting
#Function for the lorenz equation
#u[1] = x; u[2] = y; u[3] = z
function acdc!(du,u,p,t)
    a_x = 15e-2
    a_y = 2.7e-2

    b_x = 5.9
    b_y = 5.4

    delta_y = 1.07
    delta_z = 1.12

    z_x = 6.4e-5
    y_z = 11e-3
    x_z = 12e-2
    x_y = 8.3e-4

    n_zx = 2.34
    n_xy = 2.0
    n_xz = 2.0
    n_yz = 2.0

    S = p[1] #0.01, 10, 1e5 - values for 2D.

    du[1] = (a_x + b_x*S)/(1 + S + (u[3]/z_x)^n_zx) - u[1]               #dx/dt
    du[2] = (a_y + b_y*S)/(1 + S + (u[1]/x_y)^n_xy) - delta_y*u[2]        #dy/dt
    du[3] = (1/(1 + (u[1]/x_z)^n_xz + (u[2]/y_z)^n_yz)) - delta_z*u[3]         #dz/dt
end

u0 = [0.0;0.0;0.0]                      #intial conditions
tspan = (0.0,100.0)                     #start and end time

## 2D. Evaluate ODE for S = 0.02, 10, 1e5
# when solving 2D I manually changed the S values within the acdc function
# currently it is formatted to take an input S, this is helpful for part E
# this code is commented out so that part E can run properly
# one can simply uncomment this code and change the S values within acdc function
# to reach the figures generated on the sidebar

# prob = ODEProblem(acdc!,u0,tspan)     #Create an ODE problem for the Lorenz fxn
# sol = solve(prob)                       #Solve the system
# plt1x = plot(sol,vars=(0,1), xaxis="t", yaxis ="X", legend=false, title = "X vs t (S = 10^5)")
# savefig(plt1x, "./2D_###.png") # manually change name in sidebar
# display(plt1x)


## 2E. Steady-state below Hopf bifurcation point

# "b" denotes below
ss_eb = zeros(0)

#Signal = 0.1
prob2_eb = ODEProblem(acdc!,u0, p = 1e-1 ,tspan) #took S value from figure 2a #8e-2
sol2_eb = solve(prob2_eb);
append!(ss_eb, sol2_eb[length(sol2_eb)])

# test1 = plot(sol2_eb, vars=(0,2), title = "test1")
# display(test1)

cell1_u0b = ss_eb

cell2_u0b = ss_eb*1.25

cell3_u0b = ss_eb*0.75

prob2_cell1b = ODEProblem(acdc!,cell1_u0b, p = 100, tspan)
sol2_cell1b = solve(prob2_cell1b);
cellb = plot(sol2_cell1b, vars=(0,[3]), xaxis="t", yaxis=("Z",:log), title="Cells Below Hopf", label = "Cell 1")

prob2_cell2b = ODEProblem(acdc!,cell2_u0b, p = 100, tspan)
sol2_cell2b = solve(prob2_cell2b);
plot!(sol2_cell2b, vars=(0,[3]), label = "Cell 2")

prob2_cell3b = ODEProblem(acdc!,cell3_u0b, p = 100, tspan)
sol2_cell3b = solve(prob2_cell3b);
plot!(sol2_cell3b, vars=(0,[3]), label = "Cell 3")

display(cellb)
savefig(cellb, "./belowHopf.png")


## 2E. Steady-state above Hopf bifurcation point

# "a" denotes above
ss_ea = zeros(0)

# Signal = 1e4
prob2_ea = ODEProblem(acdc!,u0, p = 8e3 ,tspan) # took S value from figue 2a #8e3
sol2_ea = solve(prob2_ea);
append!(ss_ea, sol2_ea[length(sol2_ea)])

# S105ss = plot(sol2_ea, vars=(0,3), xaxis="t", yaxis="Z", title="Z @ SS, S = 105", legend=false) #:log,(1e-3,10^-1))
# display(S105ss)
# savefig(S105ss, "S105ss.png")

cell1_u0a = ss_ea

cell2_u0a = ss_ea*1.25

cell3_u0a = ss_ea*0.75

prob2_cell1a = ODEProblem(acdc!,cell1_u0a, p = 100, tspan)
sol2_cell1a = solve(prob2_cell1a);
cella = plot(sol2_cell1a, vars=(0,[3]), xaxis="t", yaxis=("Z",:log), title="Cells Above Hopf", label="Cell 1")

prob2_cell2a = ODEProblem(acdc!,cell2_u0a, p = 100, tspan)
sol2_cell2a = solve(prob2_cell2a);
plot!(sol2_cell2a, vars=(0,[3]),label = "Cell 2")

prob2_cell3a = ODEProblem(acdc!,cell3_u0a, p = 100, tspan)
sol2_cell3a = solve(prob2_cell3a);
plot!(sol2_cell3a, vars=(0,[3]), label="Cell 3")

display(cella)
savefig(cella, "./aboveHopf.png")
