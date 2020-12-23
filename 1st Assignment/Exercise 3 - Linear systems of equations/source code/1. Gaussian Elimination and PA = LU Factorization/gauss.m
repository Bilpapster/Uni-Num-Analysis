function vectorX = gauss(aMatrix, 
                         aRightHandSideVector)
                                  
  if (rows(aMatrix) != columns(aMatrix))
    error("gauss: The input matrix is not square! I can't put up with this!");
  endif
                                  
  [matrixP, matrixL, matrixU] = PA_LU(aMatrix);        % performs PA=LU factorization
  
  vectorB = matrixP * aRightHandSideVector;            
  vectorC = forwardSubstitution(matrixL, vectorB);     % solves Lc = b for c
  vectorX = backSubstitution(matrixU, vectorC);        % solves Ux = c for x
  
endfunction