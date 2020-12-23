function [matrixP, matrixL, matrixU] = PA_LU(aMatrix)
  rowsOfMatrix = rows(aMatrix);
  columnsOfMatrix = columns(aMatrix);
  
  matrixP = eye(size(aMatrix));
  matrixL = eye(size(aMatrix));
  
  for parsingIndex = 1:rowsOfMatrix
    pivotRow = findPivotInColumn(parsingIndex, aMatrix);
    if (parsingIndex != pivotRow)
      aMatrix = exchangeRows(parsingIndex, pivotRow, aMatrix, parsingIndex);
      matrixL = exchangeRows(parsingIndex, pivotRow, matrixL, 1, parsingIndex-1);
      matrixP = exchangeRows(parsingIndex, pivotRow, matrixP);
    endif
    
    for rowToEliminate = parsingIndex+1:rowsOfMatrix
      multiplier = aMatrix(rowToEliminate, parsingIndex) / aMatrix(parsingIndex, parsingIndex);
      aMatrix(rowToEliminate, parsingIndex+1:columnsOfMatrix) -= multiplier*aMatrix(parsingIndex, parsingIndex+1:columnsOfMatrix);
      matrixL(rowToEliminate, parsingIndex) = multiplier;
    endfor
  endfor

  matrixU = aMatrix;
endfunction