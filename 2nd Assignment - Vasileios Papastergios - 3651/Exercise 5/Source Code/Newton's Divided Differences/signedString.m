function [stringToReturn] = signedString (aNumber)
  stringToReturn = num2str(aNumber);
  signAsString = "";
  
  if (aNumber >= 0)
    signAsString = "+";
  endif
  
  stringToReturn = strcat(signAsString, stringToReturn);
endfunction
