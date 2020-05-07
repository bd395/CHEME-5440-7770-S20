include("PhasePortraitV2_3.jl")

# Function for a dual repression system without cooperativity
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)
function toggleMono(u, v)
    alpha = 10.0               #degradation rate const. for repressor 1
    n = 1.0               #degradation rate const. for repressor 2

    udot = @. -u + alpha/(1+v^n)
    vdot = @. -v + alpha/(1+u^n)   #eqn 12

    return (udot,vdot)
end


#Range of x1, x2 values
x1range = (1,3,15)          #Has the form (min, max, num points)
x2range = (1,3,15)          #Has the form (min, max, num points)
x₀ = ([1.0, 10.0],)  #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, x1range, x2range, xinit=(), t=tspan, clines=true,
        norm=true, scale=0.5)


# Problem 3a

# u = concentration of repressor 1,
# v = concentration of repressor 2,
# a1 is the effective rate of synthesis of repressor 1,
# a2 is the effective rate of synthesis of repressor 2,
# n is the cooperativity of repression of promoter 2
# n is the cooperativity of repression of promoter 1.
# The final form of the toggle equations preserves the
# two most fundamental aspects of the network: cooperative
# repression of constitutively transcribed promoters (the first term in each
# equation), and degradation/dilution of the repressors (the second term in
# each equation).
#
# The parameters a1 and a2 are lumped parameters that describe the
# net effect of RNA polymerase binding, open-complex formation,
# transcript elongation, transcript termination, repressor binding, ribosome
# binding and polypeptide elongation. The cooperativity described by b
# and g can arise from the multimerization of the repressor proteins and the
# cooperative binding of repressor multimers to multiple operator sites in
# the promoter. An additional modi®cation to equation (1) is needed to
# describe induction of the repressors (Fig. 5).
