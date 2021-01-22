function [x_normalized] = normalizeInMinPiPi(x_arbitrary)
  x_normalized = mod(x_arbitrary, 2*pi);
  if (x_normalized > pi)
    x_normalized -= 2*pi;
  endif
endfunction


