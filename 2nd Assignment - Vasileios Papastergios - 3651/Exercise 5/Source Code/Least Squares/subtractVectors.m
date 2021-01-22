function vectorToReturn = subtractVectors(a, b) 
  for i = 1:columns(a)
    a(i) -= b(i);
  endfor
  vectorToReturn = a;
endfunction