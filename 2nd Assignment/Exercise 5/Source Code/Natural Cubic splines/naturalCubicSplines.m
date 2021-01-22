function coefficientsMatrix = naturalCubicSplines(x, y)

  # initializes the structures that are going to be used
  n = length(x);
  A = zeros(n, n);
  rightHandSide = zeros(n, 1);
  coefficientsMatrix=zeros(n,3);

  # evaluates the differences for x and y values
  for i=1:n-1
    deltaX(i) = x(i+1) - x(i);
    deltaY(i) = y(i+1) - y(i);
  endfor
  
  A(1, 1) = A(n, n) = 1;      % endpoint conditions for natural splines
  
  for i = 2:n-1               % constructs matrix A and right hand side vector 
    A(i, i-1) = deltaX(i-1);
    A(i, i) = 2*(deltaX(i-1) + deltaX(i));
    A(i, i+1) = deltaX(i);
    
    rightHandSide(i) = 3*(deltaY(i)/deltaX(i) - deltaY(i-1)/deltaX(i-1));
  endfor
  
  % solves system for c within accuracy of 4 decimal places (default argument in gaussSeidel method). c is placed on the second column of the coefficients matrix
  coefficientsMatrix(:, 2) = gaussSeidelMethod(A, rightHandSide);
  
  % based on the solution of c, solves for b and d
  for i=1:n-1
    coefficientsMatrix(i, 3) = (coefficientsMatrix(i+1, 2) - coefficientsMatrix(i, 2))/(3*deltaX(i)); 
    coefficientsMatrix(i, 1) = (deltaY(i))/(deltaX(i)) - (deltaX(i)/3)*(2*coefficientsMatrix(i, 2) + coefficientsMatrix(i+1, 2));
  endfor

  % cuts off the unnecessary last value of vector c
  coefficientsMatrix=coefficientsMatrix(1:n-1,1:3);

endfunction
