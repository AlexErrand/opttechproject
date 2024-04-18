# Define the parameters
α = 0.5 # ... value for α ...
β = 1  # given
δ = 0.05# ... value for δ, the interest rate ...
f_max = 1  # scaling to set f_max = 1
u_max = 0.1# ... maximum value for u(t) ...

# Define the initial conditions
f0 = f_max  # initial fish population
m0 = 0    # initial money in the bank

# Time discretization
T = 10# ... final time ...
N = 100# ... number of time steps ...
dt = T / N  # time step size

# Initialize the state variables
f = zeros(N+1)
m = zeros(N+1)
f[1] = f0
m[1] = m0

# Example constant control
u = u_max / 2 # Half of the maximum effort, as an example

# Discretize the system using Euler's method
for k in 1:N
    dfdt = α * (f_max - f[k]) - f[k] * u
    dmdt = δ * m[k] + f[k] * u
    
    f[k+1] = f[k] + dt * dfdt
    m[k+1] = m[k] + dt * dmdt
end

# Output the final state variables to check if the discretization seems reasonable
println("Final fish population: ", f[end])
println("Final money in the bank: ", m[end])

# Plot the results
using Plots
plot(0:dt:T, f, label="Fish Population", xlabel="Time", ylabel="Fish Population", title="Fish Population Over Time")
plot!(0:dt:T, m, label="Company Money", secondary=true, ylabel="Company's Money")
display(plot)

