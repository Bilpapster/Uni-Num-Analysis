#{
Really simple script-function that swaps values between two numerical variables.
Exchanging the values is based on adding and subtracting the two values 
(and not based on a temporary, auxiliary variable), so the function can only be
used for swapping values between numerical arguments.
#}

function [a, b] = swapNumbers(a, b)
  a = a + b;
  b = a - b;
  a = a - b;
endfunction