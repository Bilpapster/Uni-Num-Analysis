function x = backSubstitution(U, x)
  [n,n] = size(U);
  
  for k = n:-1:1
    j = k+1:n;
    x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
  end                                    
endfunction