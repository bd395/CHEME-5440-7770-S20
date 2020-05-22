using Plots
using LinearAlgebra


ke = 10e-4 # 1/s
ke_s = 5e-3 # 1/s
kf = 5.14e-21 # m3/s
kr = 2.5e-2 # 1/s
kdeg = 8e-4 # 1/s
Vs = 18 # 1/s/cell

q = 1e3 # #/cell/s
nc = 3e8 # cell/m2


Rs_s = (1/ke_s + 1/kdeg)
Kss = ke_s*kf/(ke*(kr + ke_s))

Dl = 1e-10 # m2/s
gamma = 1e2 # 1/s


z = collect(0:1:20)
km = transpose(Dl/z).*(gamma*z.^2/Dl).^(1/3)

L = (q - kr*Rs_s)/(km/nc)

Rt_s = Rs_s*Kss*L*Vs

plot2d = plot(z,transpose(Rt_s), xaxis="z (m)", yaxis="R⋆ Total", label=false, title="R⋆ Total vs z")

savefig(plot2d, "./plot2d.png")

display(plot2d)
