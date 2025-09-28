
x = 0:0.1:6.28; // This is a full circle in radians
y1 = sin(x);
y2 = cos(x);

// Plot two lines: sin(x) in red, cos(x) in blue
plot(x, y1, 'r-', x, y2, 'b--');

// Add a legend to explain which line is which
legend("sin(x)", "cos(x)");
