function x = gaussSeidelMethod(aMatrix, 
                               aRightHandSideVector, 
                               xInitial = zeros(1, rows(aMatrix)), 
                               decimalPlacesAccuracy = 4)

  desiredAccuracy = 0.5*10^(-decimalPlacesAccuracy);

  if rows(aMatrix) != columns(aMatrix)
    error("gaussSeidelMethod: The input matrix is not square! I cannot put up with it!");
  endif
  
  if rows(aMatrix) != columns(xInitial)
    error("gaussSeidelMethod: Incorrect number of initial guesses!");
  endif
  
  
  x = xInitial;
  do
    xPrevious = x;
    unknown = 0;
    for unknownCounter = x
      unknown++;
      x(unknown) = aRightHandSideVector(unknown);
      otherUnknown = 0;
      for otherUnknownCounter = x
        otherUnknown++;
        if unknown == otherUnknown
          continue;
        endif
        x(unknown) -= aMatrix(unknown, otherUnknown)*x(otherUnknown);
      endfor
      x(unknown) /= aMatrix(unknown, unknown);
    endfor
  until (infiniteNormOf(subtractVectors(x, xPrevious)) < desiredAccuracy)
  
endfunction