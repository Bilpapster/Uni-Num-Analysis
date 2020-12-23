function pivotRowIndex = findPivotInColumn(aColumn, aMatrix)
  pivotRowIndex = aColumn;
  for otherRow = aColumn+1:rows(aMatrix)
    if abs(aMatrix(otherRow, aColumn)) > abs(aMatrix(pivotRowIndex, aColumn))
      pivotRowIndex = otherRow;
    endif
  endfor
endfunction