function x = forwardSubstitution(L, b)

  [n,n] = size(L);
  for k = 1:n
    j = 1:k-1;
    x(k) = (b(k) - L(k,j)*b(j))/L(k,k);
  end
  x = x';  
endfunction