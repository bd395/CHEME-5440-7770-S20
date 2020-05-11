using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting
#Function for the bistable switch circuit
#u[1] = x; u[2] = z;
function bistable!(du, u, p, t)
    alpha_x = 1.5
    beta_x = 5.0
    z_x = 0.4
    n_zx = 2.7
    x_z = 1.5
    n_xz = 2.7
    delta_z = 1.0

    delta_x = 1
    alpha_z = 1
    S = p[1]

    du[1] = ((alpha_x + beta_x*S)/(1 + S + ((u[2]/z_x)^n_zx))) - delta_x*u[1]
    du[2] = (alpha_z/(1 + ((u[1]/x_z)^n_xz))) - delta_z*u[2]
end

u0 = [0.0,0.0] #intial conditions
xParams = collect(0:1:10)#10 .^(range(-2,stop=2,length=50)) #collect(0:0.001:10)
ss_vals_x = zeros(0)

# this code throws an error when exponents are fractional
# for i = 1:length(Params)
#     P = Params[i]
#     probSS = SteadyStateProblem(bistable!, u0, P)
#     solSS = solve(probSS)
#     SS = Array(solSS)
#     append!(ss_vals_x, SS[1])
# end

# take last value of ODE problem (because it has reached steady-state)
for i = 1:length(xParams)
    P = xParams[i] #100
    prob = ODEProblem(bistable!, u0, p = P, tspan)
    sol = solve(prob)
    append!(ss_vals_x, sol[1,length(sol)])
end

#plt2c_test = plot(xParams, ss_vals_x, xaxis = "S", yaxis = "X", label=false, title = "X vs S (Steady-State)")
#savefig(plt2c, "./new.png")
#display(plt2c)

newplot = plot(xParams, ss_vals_x, xaxis = "S", yaxis = "X", label=false, title = "X vs S (Steady-State)")
savefig(newplot, "./2C_new.png")
display(newplot)
