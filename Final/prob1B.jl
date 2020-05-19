include("phasePortrait.jl")

# Function for a dual repression system without cooperativity
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)
function notchdelta(dNdt, N1, N2)
    # D1 = 1
    # D2 = 1

    dNdt[1] = (1/(1+10*N2^2))/(0.1 + (1/(1+10*N2^2)))
    dNdt[2] = (1/(1+10*N1^2))/(0.1 + (1/(1+10*N1^2)))

    # N1dot = @. - N1
    # N2dot = @. - N2

    return dNdt #(N1dot, N2dot)
end

#Range of x1, x2 values
N1_range = (-20,20,11)          #Has the form (min, max, num points)
N2_range = (-20,20,11)          #Has the form (min, max, num points)
n0 = ([1.0,4.0],)
#x₀ = ([1.0, 10.0],)  #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span
#print(length(tspan))
#Call the phaseplot functon to construct the phase portrait
phaseplot(notchdelta, N1_range, N2_range, xinit=n0 , t=tspan, clines=true,
        norm=true, scale=0.5)

#plot(t, sol, vars=(1))
#print(t)
#print(sol)
#ca_ode = sol[1,:];
#cr_ode = sol[2,:];

#plot(tspan,ca_ode)


#plot(tspan,)

# xinit=()
