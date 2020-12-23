f = @(x) 94*((cos(x))^3)-24*cos(x)+177*((sin(x))^2)-108*((sin(x))^4)-72*((cos(x)^3))*(sin(x)^2)-65; 
f_derivative = @(x) 216*cos(x)^2 * sin(x)^3 -432*(cos(x)*sin(x)^3) -144*cos(x)^4 * sin(x) -282*cos(x)^2*sin(x)+ 354*cos(x)*sin(x)+24*sin(x);
f_second_derivative = @(x) 3*cos(x)*(216*cos(x)^2 -432*cos(x))*sin(x)^2 +sin(x)*(576*cos(x)^3*sin(x)+564*cos(x)*sin(x) -354*sin(x))+sin(x)^3*(432*sin(x)-432*cos(x)*sin(x))+cos(x)*(-144*cos(x)^4 -282*cos(x)^2 +354*cos(x)+24);

%STEP 3a: Calculate the roots of f using the modified Bisection Method and print the number of iterations required 
[root, iterations] = bisectionMethodModified(f, 0, 1, 5);
printf("root = %.5f found with %d iterations (Bisection Method Modified)\n", root, iterations);

[root, iterations] = bisectionMethodModified(f, 1, 2, 5);
printf("root = %.5f found with %d iterations (Bisection Method Modified)\n", root, iterations);

[root, iterations] = bisectionMethodModified(f, 2, 3, 5);
printf("root = %.5f found with %d iterations (Bisection Method Modified)\n\n", root, iterations);


%STEP 3b: Calculate the roots of f using the modified Newton-Raphson Method and print the number of iterations required 
[root, iterations] = newtonRaphsonMethodModified(f, f_derivative, f_second_derivative, 0.5, 5);
printf("root = %.5f found with %d iterations (Newton-Raphson Method Modified)\n", root, iterations);

[root, iterations] = newtonRaphsonMethodModified(f, f_derivative, f_second_derivative, 1, 5);
printf("root = %.5f found with %d iterations (Newton-Raphson Method Modified)\n", root, iterations);

[root, iterations] = newtonRaphsonMethodModified(f, f_derivative, f_second_derivative, 2.5, 5);
printf("root = %.5f found with %d iterations (Newton-Raphson Method Modified)\n\n", root, iterations);


%STEP 3c: Calculate the roots of f using the modified Secant Method and print the number of iterations required
[root, iterations] = secantMethodModified(f, 0, 0.5, 0.75, 5);
printf("root = %.5f found with %d iterations (Secant Method Modified)\n", root, iterations);

[root, iterations] = secantMethodModified(f, 0.9, 1.1, 1.2, 5);
printf("root = %.5f found with %d iterations (Secant Method Modified)\n", root, iterations);

[root, iterations] = secantMethodModified(f, 1.5, 1.8, 2.3, 5);
printf("root = %.5f found with %d iterations (Secant Method Modified)\n", root, iterations);