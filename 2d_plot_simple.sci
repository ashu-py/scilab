x// Create a list of numbers for the x-axis, from -6 to 6, with small steps of 0.1
x = -6:0.1:6;
// Create a list of numbers for the y-axis by calculating sin(x) for each x
y = sin(x);
plot(x, y);
// Add a title to the whole graph
xtitle("My First 2D Plot", "X-axis Label", "Y-axis Label");
