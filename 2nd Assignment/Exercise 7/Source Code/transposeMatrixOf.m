function [ATranspose] = transposeMatrixOf (matrixA)
    for row = 1:rows(matrixA)
        ATranspose(:, row) = matrixA(row, :);
    endfor
endfunction
