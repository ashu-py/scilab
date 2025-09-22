// Define the circuit parameters
L = 1;      // Inductance in Henrys (H)
R = 0.5;    // Resistance in Ohms (Ω)
C = 0.5;    // Capacitance in Farads (F)
V = 10;     // DC Voltage source in Volts (V)

// Define the system of first-order ODEs
// 'x' is a vector where x(1) = charge (q) and x(2) = current (i)
function dx_dt = lcr_ode(t, x)
    dx_dt(1) = x(2);                       // dq/dt = i
    dx_dt(2) = (V/L) - (R/L)*x(2) - (1/(L*C))*x(1); // di/dt = (V/L) - (R/L)i - (1/LC)q
endfunction

// Define the initial conditions
t0 = 0;           // Initial time
x0 = [0; 0];      // Initial state vector: [q(0); i(0)] = [0; 0] (initially uncharged capacitor and zero current)

// Define the time span for the simulation
t_span = 0:0.1:20; // Solve the ODE from t=0 to t=20 seconds with a step of 0.1s

// Solve the ODE using the 'ode' function
solution = ode(x0, t0, t_span, lcr_ode);

// Extract the charge and current solutions from the result matrix
charge = solution(1,:);
current = solution(2,:);

// Plot the results
subplot(2,1,1);
plot(t_span, charge, 'b-', 'linewidth', 2);
xlabel("Time (s)");
ylabel("Charge (C)");
title("Charge on the Capacitor");
grid on;

subplot(2,1,2);
plot(t_span, current, 'r-', 'linewidth', 2);
xlabel("Time (s)");
ylabel("Current (A)");
title("Current in the Circuit");
grid on;
