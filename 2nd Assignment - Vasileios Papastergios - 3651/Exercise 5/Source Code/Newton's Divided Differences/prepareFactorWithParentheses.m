function [stringToReturn] = prepareFactorWithParentheses (numberToAdd, 
                                                          unknownAsString = "x")
                                                          
  stringToReturn = strcat("(", unknownAsString);
  numberToAddAsString = num2str(numberToAdd);
  
  if numberToAdd == 0
    numberToAddAsString = "";
  else
    numberToAddAsString = signedString(numberToAdd);
  endif
  
  stringToReturn = strcat(stringToReturn, numberToAddAsString, ")");
endfunction
