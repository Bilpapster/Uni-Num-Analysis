function [interpolatingPolynomial] = newtonsDividedDifferencesMethod (xArray, yArray)

  n = length(xArray);

  % calculates the divided differences of first order
  for i = 1:n-1
    dividedDifferences(1, i) = (yArray(i+1) - yArray(i)) / (xArray(i+1) - xArray(i));
  endfor
  
  % calculates the divided differences of higher order
  for i = 2:n-1
    for j = 1:n-i
      numerator = dividedDifferences(i-1, j+1) - dividedDifferences(i-1, j);
      denominator = xArray(i+j) - xArray(j);
      dividedDifferences(i, j) = numerator / denominator;
    endfor
  endfor
  
  polynomialAsString = num2str(yArray(1));
  
  % constructs the interpolating polynomial firstly as string, and afterwards the string is transformed to function handle
  factorAsString = "1";
  for i = 1:n-1
    factorAsString = strcat(factorAsString, "*", prepareFactorWithParentheses(-xArray(i)));
    polynomialAsString = strcat(polynomialAsString, signedString(dividedDifferences(i, 1)), "*", factorAsString);
  endfor  
  interpolatingPolynomial = inline(polynomialAsString);   % transforms the interpolating polynomial string to function handle
endfunction
