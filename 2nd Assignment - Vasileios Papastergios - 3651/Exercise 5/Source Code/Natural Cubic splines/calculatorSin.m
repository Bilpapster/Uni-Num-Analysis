function [retval] = calculatorSin (a, b, c, d, x, value)
  value = mod(value, 2*pi);
  if value > pi
    value -= 2*pi;
  endif
  
  leftIndex = 1;
  rightIndex = length(x);
  counter = 0;
  
  do
    counter++;
    middleIndex = floor((leftIndex + rightIndex) / 2);
    if (x(middleIndex) == value)
      wantedIndex = middleIndex;
      break;
    elseif (x(middleIndex) > value)
      rightIndex = middleIndex - 1;
    else 
      leftIndex = middleIndex + 1;
    endif
  until rightIndex - leftIndex <= 1
  
  wantedIndex = leftIndex;
  
  %printf("%f -- %f -- % f\ --- %d\n", x(wantedIndex), value, x(wantedIndex + 1), counter);
  
  fac = (value - x(wantedIndex));
  retval = a(wantedIndex) + b(wantedIndex)*fac + c(wantedIndex)*fac^2 + d(wantedIndex)*fac^3;
endfunction
