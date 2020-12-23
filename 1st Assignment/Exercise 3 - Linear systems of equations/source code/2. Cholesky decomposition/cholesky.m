function [RTranspose] = cholesky (aMatrix)

  n = rows(aMatrix);

  for k = 1:n
    if aMatrix(k, k) < 0 
      return;
    endif
    
    R(k, k) = sqrt(aMatrix(k, k));
    UTranspose = (1 / R(k, k))*aMatrix(k, k+1:n);
    R(k, k+1:n) = UTranspose;
    aMatrix(k+1:n, k+1:n) = aMatrix(k+1:n, k+1:n) - (UTranspose)'*UTranspose;
  endfor
  RTranspose = (R)';
endfunction
