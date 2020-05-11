bifurc_params = (
    a_x = 1.5,
    b_x = 5.0,
    s = 1,
    z_x = 0.4,
    n_zx = 2.7,
    dx = 1.0,
    a_z = 1,
    x_z = 1.5,
    n_xz = 2.7,
    dz = 1.0,
)

using Parameters: @unpack

function f!(du, u, p, t) #f(u, p, t)
    @unpack a_x, b_x, s, z_x, n_zx, dx, a_z, x_z, n_xz, dz = p
    du[1] = ((a_x + b_x*s)/(1 + s + ((u[2]/z_x)^n_zx))) - dx*u[1]
    du[2] = (a_z/(1 + ((u[1]/x_z)^n_xz))) - dz*u[2]
    return SVector(du[1], du[2]) #SVector(dxdt, dzdt)
end


using DiffEqBase: ODEProblem
using StaticArrays: SVector

#u0 = SVector(10.0, 10.0)
u0 = [0.0,0.0]#[0.001,0.01]
tspan = (1.0, 30.0)  # ignored by Bifurcations.jl
#tspan = collect(0:1:20)
ode = ODEProblem(f!, u0, tspan, bifurc_params)
#print(ode)

using Bifurcations.BifurcationsBase: BifurcationProblem
using Setfield: @lens

param_axis = @lens _.s
prob = BifurcationProblem(ode, param_axis, (0,2))

using DiffEqBase: init, solve!

solver = init(prob, start_from_nearest_root = true)
solve!(solver)
sol = solver.sol


using Plots

plt = plot(sol, yaxis="X")
savefig(plt,"./new.png")
display(plt)
