function [x, iterations] = gauss_seidel(A, b, x0)
    //
    // Gauss-Seidel Method
    //
    // Solves the system of linear equations Ax = b iteratively.
    //
    // Parameters:
    // A: The coefficient matrix (must be square).
    // b: The constant vector.
    // x0: The initial guess vector.
    //
    // Returns:
    // x: The solution vector.
    // iterations: The number of iterations taken to converge.
    //

    // Check if the matrix is square
    [m, n] = size(A);
    if m ~= n then
        error("The coefficient matrix A must be square.");
    end

    // Check for diagonal dominance (a sufficient condition for convergence)
    for i = 1:n
        sum_row = sum(abs(A(i, :))) - abs(A(i, i));
        if abs(A(i, i)) <= sum_row then
            warning("The matrix A is not strictly diagonally dominant. The method may not converge.");
        end
    end

    // Initialize variables
    x = x0;
    iterations = 0;
    max_iter = 1000;
    tolerance = 1e-6;

    // Main iteration loop
    for k = 1:max_iter
        x_prev = x; // Store the solution from the previous iteration
        
        // Loop through each equation
        for i = 1:n
            // Check for a zero on the diagonal to prevent division by zero
            if A(i, i) == 0 then
                error("A diagonal element is zero. The method cannot proceed.");
            end

            // Calculate the sum of terms from previous and current iterations
            sum_val = 0;
            for j = 1:n
                if i ~= j then
                    sum_val = sum_val + A(i, j) * x(j);
                end
            end
            
            // Update the current x(i) using the newly calculated sum
            x(i) = (b(i) - sum_val) / A(i, i);
        end

        // Check for convergence based on a small change in the solution vector
        if norm(x - x_prev) < tolerance then
            iterations = k;
            return; // Exit the function once converged
        end
    end

    // If the loop finishes without converging
    iterations = max_iter;
    warning("The Gauss-Seidel method did not converge within the maximum number of iterations.");
endfunction

// --- Example Usage ---
// Define a sample system of equations:
// 4x1 - x2 + 0x3 = 10
// -x1 + 4x2 - x3 = 5
// 0x1 - x2 + 4x3 = 10

A = [4 -1 0; -1 4 -1; 0 -1 4];
b = [10; 5; 10];
x0 = zeros(3, 1); // Initial guess (e.g., all zeros)

disp("Solving system Ax=b using Gauss-Seidel method:");
disp("Matrix A:");
disp(A);
disp("Vector b:");
disp(b);
disp("Initial guess x0:");
disp(x0);

// Call the gauss_seidel function
[solution, iters] = gauss_seidel(A, b, x0);

// Display the results
disp("----------------------------------");
disp("Final Solution x:");
disp(solution);
disp(sprintf("Converged in %d iterations.", iters));

// You can also verify the solution by calculating A*x
disp("Verification (A*x):");
disp(A * solution);
disp("Original b:");
disp(b);
