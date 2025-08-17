// --- Section 1: Initialization ---
clc; // Clear the console
clear; // Clear all variables
disp('*** Gaussian Elimination for a System of Linear Equations ***');
disp('This program solves Ax = B using Gaussian elimination with back substitution.');

// Define the coefficient matrix A and the constant vector B
// This represents the system of equations:
// 1x + 1y + 1z = 3
// 1x + 2y + 3z = 1
// 1x + 3y + 2z = 3
A = [1 1 1; 1 2 3; 1 3 2];
B = [3; 1; 3];

// Display the initial matrices for clarity
disp(' '); // Add a blank line for better formatting
disp('The coefficient matrix (A) is:');
disp(A);
disp('The constant vector (B) is:');
disp(B);

// --- Section 2: Forward Elimination ---
// Create the augmented matrix [A|B]
Aug = [A, B];
n = size(A, 'r'); // Get the number of rows (n) from matrix A

disp(' ');
disp('Step 1: Forward Elimination to get an upper triangular matrix.');

// Loop through each row to create the upper triangular form
for i = 1:n
    // Check for a non-zero pivot element to avoid division by zero.
    // In a robust implementation, we would perform row swapping (pivoting) here.
    if Aug(i, i) == 0 then
        error('Zero pivot encountered! Gaussian elimination requires a non-zero pivot.');
    end

    // Normalize the current pivot row by dividing it by the pivot element.
    // This makes the diagonal element (the pivot) equal to 1.
    Aug(i, :) = Aug(i, :) / Aug(i, i);
    
    // Eliminate all elements below the current pivot
    for j = i+1:n
        // Calculate the factor to multiply the pivot row by.
        // This factor is chosen to make the element below the pivot zero.
        factor = Aug(j, i);
        
        // Subtract a multiple of the pivot row from the current row.
        // This eliminates the element in the current column (Aug(j, i)).
        Aug(j, :) = Aug(j, :) - factor * Aug(i, :);
    end
    
    // Display the matrix after each major step for a clear walkthrough.
    disp(' ');
    disp(['Matrix after step ', string(i), ':']);
    disp(Aug);
end

// --- Section 3: Back Substitution ---
disp(' ');
disp('Step 2: Back Substitution to find the solution vector (x).');

// Initialize the solution vector 'x'
x = zeros(n, 1);

// Start from the last row and work upwards
for i = n:-1:1
    // The solution for the last variable is straightforward from the last row.
    if i == n then
        x(n) = Aug(n, n+1);
    else
        // For other rows, subtract the known values of the variables
        // from the augmented column to find the current variable.
        sum_of_knowns = 0;
        for j = i+1:n
            sum_of_knowns = sum_of_knowns + Aug(i, j) * x(j);
        end
        x(i) = Aug(i, n+1) - sum_of_knowns;
    end
end

// --- Section 4: Result Verification ---
disp(' ');
disp('The solution vector (x) is:');
disp(x);

// Verify the solution by checking if A*x equals B
disp(' ');
disp('Verification:');
disp('A * x = ');
disp(A*x);
disp('B = ');
disp(B);

// Compare the results to see if they are close
if norm(A*x - B) < 1e-9 then
    disp('Verification successful! The solution is correct.');
else
    disp('Verification failed. There may be a numerical error.');
end
