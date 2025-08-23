// Scilab Program for Ohm's Law Plot

clc; // Clear the console
clear; // Clear all variables
close; // Close all plots

//--- Theoretical Values ---
R_theoretical = 100; // Resistance in Ohms (Ω)
V_theoretical = 0:1:100; // Voltage in Volts (V), from 0 to 100
I_theoretical = V_theoretical / R_theoretical; // Current in Amperes (A) from Ohm's Law (I = V/R)

//--- Experimental Values ---
// To simulate experimental measurements, we introduce a small random error.
R_experimental = R_theoretical + 5*rand(1, 'uniform') - 2.5; // Random resistance with a small deviation
V_experimental = V_theoretical;
// Calculate the experimental current with deviation.
I_experimental = V_experimental / R_experimental + 0.05*rand(1, length(V_experimental), 'normal'); // Adding a small random normal deviation

//--- Plotting the Graph ---
scf(0); // Create a new graphics window
plot(V_theoretical, I_theoretical, 'b-o', 'LineWidth', 2); // Plot theoretical values as blue circles connected by a line
plot(V_experimental, I_experimental, 'r-*', 'LineWidth', 1); // Plot experimental values as red stars connected by a line
 
//--- Labels and Titles ---
title('Ohm''s Law: Theoretical vs. Experimental Values');
xlabel('Voltage (V)');
ylabel('Current (A)');
legend('Theoretical (R = 100 Ω)', 'Experimental (with deviation)');
grid('on'); // Turn on the grid
a=gca();
a.font_size=2;
a.font_style=2;
