include("Include.jl")

# load the data dictionary -
# data_dictionary = maximize_urea_production(0,0,0)
data_dictionary = maximize_urea_production_open(0,0,0);

# solve the lp problem -
(objective_value, flux_array, dual_array, uptake_array, exit_flag) = calculate_optimal_flux_distribution(data_dictionary);

println("Max urea production: ", -objective_value, "mmol/gdw*hr")
