function [eigenvalue, eigenvector] = powerMethod (aMatrix,
                                                  initialVector = rand(columns(aMatrix), 1),
                                                  decimalPlacesAccuracy = 6)
  [n, n] = size(aMatrix);
  desiredAccuracy = 0.5 * 10 ^(-decimalPlacesAccuracy);

  if rows(aMatrix) != columns(aMatrix)
    error("powerMethod: The input matrix is not square! I cannot put up with it!");
  endif
  
  while initialVector == zeros(columns(aMatrix), 1) 
    initialVector = rand(n, 1);
  endwhile
  
  u = initialVector;
  l = inf;
  
  do
    lPrevious = l;
    w = aMatrix * u;
    l = normOf(w);
    u = (1/l) * w;
  until abs(l - lPrevious) < desiredAccuracy
  
  eigenvalue = l;
  eigenvector = u;
  
endfunction
