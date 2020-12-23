function [root, iterationsExecuted] = bisectionMethodModified(aFunction, 
                                                              leftLimit, 
                                                              rightLimit, 
                                                              decimalPlacesAccuracy)
                                                      
    if (leftLimit > rightLimit)
        [leftLimit, rightLimit] = swapNumbers(leftLimit, rightLimit);
    endif
    
    iterationsExecuted = 0;
    desiredAccuracy = 0.5 * 10^(-decimalPlacesAccuracy);

    if (aFunction(leftLimit)*aFunction(rightLimit) > 0) 
        error("bisectionMethodModified: The given interval does not meet the Bolzano's Theorem requirements. The product f(a)*f(b) must be non-positive!");         
    elseif (aFunction(leftLimit) == 0)
        root = leftLimit;
        return;
    elseif (aFunction(rightLimit) == 0)
        root = rightLimit;
        return;
    endif
     
    while ((rightLimit - leftLimit) >= desiredAccuracy)
        iterationsExecuted++;
        middle = leftLimit + (rightLimit - leftLimit)*rand();
        if (aFunction(middle) == 0)
            root = middle;
            return;
        elseif (aFunction(leftLimit)*aFunction(middle) < 0)
            rightLimit = middle;
        else
            leftLimit = middle;
        endif
    endwhile
    root = leftLimit + (rightLimit - leftLimit)*rand();
endfunction