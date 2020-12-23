f = @(x) 94*((cos(x))^3)-24*cos(x)+177*((sin(x))^2)-108*((sin(x))^4)-72*((cos(x)^3))*(sin(x)^2)-65; 
f_derivative = @(x) 216*cos(x)^2 * sin(x)^3 -432*(cos(x)*sin(x)^3) -144*cos(x)^4 * sin(x) -282*cos(x)^2*sin(x)+ 354*cos(x)*sin(x)+24*sin(x);
f_second_derivative = @(x) 3*cos(x)*(216*cos(x)^2 -432*cos(x))*sin(x)^2 +sin(x)*(576*cos(x)^3*sin(x)+564*cos(x)*sin(x) -354*sin(x))+sin(x)^3*(432*sin(x)-432*cos(x)*sin(x))+cos(x)*(-144*cos(x)^4 -282*cos(x)^2 +354*cos(x)+24);

sum = 0;
n = 10;
for i=1:n
  [root, iterations] = bisectionMethodModified(f, 2, 3, 5);
  iterations
  sum += iterations;
  %printf("root = %.5f found with %d iterations (Bisection Method Modified)\n", root, iterations);
endfor

sum/n