
// Define the decay constant (lambda)
lambda = 0.1; // s^-1

// Define the ODE function
// The function takes time (t) and the number of nuclei (N) as input.
// It returns the rate of change of N (dN/dt).
function dNdt = decay_ode(t, N)
    dNdt = -lambda * N;
endfunction

// Set the initial conditions
t0 = 0; // Initial time (s)
N0 = 1000; // Initial number of nuclei

// Define the time points for the simulation
t_span = 0:0.5:50; // Solve the ODE from t=0 to t=50 s, with a step of 0.5 s

// Solve the ODE using the 'ode' function
// The arguments are: initial value (N0), initial time (t0), time points (t_span), and the function name (@decay_ode).
N_solution = ode(N0, t0, t_span, decay_ode);

// Plot the results
plot(t_span, N_solution, 'b-', 'linewidth', 2);
xlabel("Time (s)");
ylabel("Number of Nuclei");
title("Radioactive Decay");
grid on;
