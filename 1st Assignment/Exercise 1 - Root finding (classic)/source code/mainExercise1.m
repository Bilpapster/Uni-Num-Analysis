#{
The following code serves as drive-script for the 1st Excercise, contained in the 1st Set of Obligatory Exercises.

At first, the given function and its first derivative are declared hardcoded as functions of variable x.

Afterwards, the function f is plotted, limiting the x-axis within the interval [-2, 2]. 
The y-axis is also limited within the same interval ([-2, 2]) for enhanced visual supervision of the values
of the function near 0, since the function's roots are the main objective of the exercise.

Next, the function and its first derivative (if needed) are passed as arguments to the three iterative root-calculating algorithms:
  - Classic Bisection algorithm (derivative not needed)
  - Classic Newton-Raphson algorithm (derivative needed)
  - Classic Secant algorithm (derivative not needed)
  
Taking for granted that the function has 3 roots (-1.19762, 0, 1.53013) in the interval of interest ([-2, 2]), 
the script reports the number of iterations each one of the above algorithms takes, in order to calculate the roots
within accuracy of 5 decimal places. The output is printed on the Command Window.
#}

% STEP 1: Declare the function f and its first derivative (hardcoded declaration)
f = @(x) e.^(sin(x).^3) + x.^6 - 2.*x.^4 - x.^3 - 1;
f_derivative = @(x)  3.*e.^(sin(x).^3).*(sin(x).^2).*cos(x) + 6.*x^5 - 8.*x.^3 - 3.*x.^2;
f_second_derivative = @(x) 9.*e.^sin(x).^3.*cos(x).^2.*sin(x).^4-3.*e.^sin(x).^3.*sin(x).^3+6.*e.^sin(x).^3.*cos(x).^2.*sin(x)+30.*x.^4-24.*x.^2-6.*x;

%STEP 2: Plot the function f in the square interval [-2, 2] x [-2, 2]
%makePlotOf(f, "e^{sin^{3}(x)} + x^6 - 2x^4 - x^3 - 1");
%makePlotOf(f_second_derivative, "123");

%STEP 3a: Calculate the roots of f using the Classic Bisection Method and print the number of iterations required 
[root, iterations] = bisectionMethod(f, -2, -1, 5);
printf("root = %.5f found with %d iterations (Bisection Method)\n", root, iterations);

[root, iterations] = bisectionMethod(f, 1, 2, 5);
printf("root = %.5f found with %d iterations (Bisection Method)\n", root, iterations);

[root, iterations] = bisectionMethod(f, -1.3, 1.3, 5);
printf("root = %.5f found with %d iterations (Bisection Method)\n\n", root, iterations);


%STEP 3b: Calculate the roots of f using the Classic Newton-Raphson Method and print the number of iterations required 
[root, iterations] = newtonRaphsonMethod(f, f_derivative, -1.4, 5);
printf("root = %.5f found with %d iterations (Newton-Raphson Method)\n", root, iterations);

[root, iterations] = newtonRaphsonMethod(f, f_derivative, 1.8, 5);
printf("root = %.5f found with %d iterations (Newton-Raphson Method)\n", root, iterations);

[root, iterations] = newtonRaphsonMethod(f, f_derivative, -0.7, 5);
printf("root = %.4f found with %d iterations (Newton-Raphson Method). Multiplicity not involved\n", root, iterations);

[root, iterations] = newtonRaphsonMethod(f, f_derivative, -0.7, 5, 4);
printf("root = %.4f found with %d iterations (Newton-Raphson Method). Multiplicity involved\n\n", root, iterations);


%STEP 3c: Calculate the roots of f using the Classic Secant Method and print the number of iterations required
[root, iterations] = secantMethod(f, -2, -1, 5);
printf("root = %.5f found with %d iterations (Secant Method)\n", root, iterations);

[root, iterations] = secantMethod(f, 1.3, 1.6, 5);
printf("root = %.5f found with %d iterations (Secant Method)\n", root, iterations);

[root, iterations] = secantMethod(f, -0.8, -0.7, 5);
printf("root = %.5f found with %d iterations (Secant Method)\n", root, iterations);
