using Plots
using LinearAlgebra


ke = 1e-4 # 1/s
ke_s = 5e-3 # 1/s
kf = 5.14e-21 # m3/s
kr = 2.5e-2 # 1/s
kdeg = 8e-4 # 1/s
Vs = 18 # 1/s/cell

q = 1e3 # #/cell/s
nc = 3e8 # cell/m2

Kss = ke_s*kf/(ke*(kr + ke_s))

Dl = 1e-10 # m2/s
gamma = 1e2 # 1/s

# z range
z = collect(0:1:30)
# km is a function of z
km = transpose(Dl/z).*(gamma*z.^2/Dl).^(1/3)

# derived expression for Rs*
Rs_s = Kss*(q)/((ke_s*km/nc/Vs) .+ ke_s*Kss)

# Rt* = Rs* + Ri*
Rt_s = Rs_s*(1 + (ke_s/kdeg))

plot2da = plot(z,transpose(Rt_s), xaxis="z (m)",
        yaxis="R⋆ Total", label=false, title="R⋆ Total vs z (m)")

savefig(plot2da, "./plot2da.png")
display(plot2da)

# intrinsic mitogenic signal generation
# from notes
signal = 100/27;

norm_rate = signal*Rt_s


plot2db = plot(z, transpose(norm_rate), xaxis="z (m)",
        yaxis="Normalized Mitotic Rate (%)", label=false,
        title="Normalized Mitotic Rate (%) vs z (m)")

savefig(plot2db, "./plot2db.png")
display(plot2db)
