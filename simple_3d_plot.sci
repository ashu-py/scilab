// Create a list for x and y, from -2 to 2
x = -2:0.1:2;
y = -2:0.1:2;

// Create the grid of coordinates for every point
[X, Y] = meshgrid(x, y);

// Calculate the height (Z) for every point on the grid
Z = X.^2 + Y.^2;
plot3d(X, Y, Z);
