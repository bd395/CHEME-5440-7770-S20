include("PhasePortraitV2_2.jl")

# Function for a dual repression system without cooperativity
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)
function bioOsc(ca, cr)
    r_or = 1.0
    r_r = 100.0
    r_oa = 100.0
    r_a = 5000.0
    d_a = 30.0

    cadot = @. -d_a*ca + (r_oa + r_a*(ca^2))/(1 + ca^2 + cr^2)
    crdot = @. -cr + (r_or + r_r*(ca^2))/(1 + ca^2)

    return (cadot,crdot)
end

#Range of x1, x2 values
ca_range = (0,200,50)          #Has the form (min, max, num points)
cr_range = (0,110,50)          #Has the form (min, max, num points)
c0 = ([1.0,10.0],)
#x₀ = ([1.0, 10.0],)  #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span
#print(length(tspan))
#Call the phaseplot functon to construct the phase portrait
phaseplot(bioOsc, ca_range, cr_range, xinit=c0 , t=tspan, clines=true,
        norm=true, scale=0.5)

#plot(t, sol, vars=(1))
#print(t)
#print(sol)
#ca_ode = sol[1,:];
#cr_ode = sol[2,:];

#plot(tspan,ca_ode)


#plot(tspan,)

# xinit=()
