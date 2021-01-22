function infiniteNorm = infiniteNormOf(aRowMatrix)

  infiniteNorm = -1;
  for elementOfMatrix = aRowMatrix
    valueToCheck = abs(elementOfMatrix);
    if (valueToCheck > infiniteNorm)
      infiniteNorm = valueToCheck;
    endif
  endfor
  
endfunction