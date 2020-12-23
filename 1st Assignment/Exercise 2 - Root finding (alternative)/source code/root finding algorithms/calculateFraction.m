function returnValue = calculateFraction(aFunction, xNumerator, xDenominator)
    returnValue = aFunction(xNumerator)/aFunction(xDenominator);
endfunction