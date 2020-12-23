function finalMatrix = exchangeRows(rowIndexA, 
                                    rowIndexB, 
                                    aMatrix, 
                                    startColumn = 1, 
                                    endColumn = columns(aMatrix)) 
  
  columnRange = startColumn:endColumn;
  
  temp = aMatrix(rowIndexA, columnRange);
  aMatrix(rowIndexA, columnRange) = aMatrix(rowIndexB, columnRange);
  aMatrix(rowIndexB, columnRange) = temp;
  
  finalMatrix = aMatrix;

endfunction