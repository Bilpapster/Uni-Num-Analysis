#{
A script-function implementing the classic bisection algorithm for root-finding of an one-variable function.

Takes as parameters: 
  - an one-variable function 
  - two limit points of an interval to search for root 
  - the desired accuracy, described in decimal places on the claculated root, in relation to the actual root.
  
Returns the root found, as well as the number of iterations executed, in order to reach that root.

Warning: The given interval must meet the requirements of the Bolzano's Theorem. 
Otherwise, the function ends by printing an error message.
#}

function [root, iterationsExecuted] = bisectionMethod(aFunction, 
                                                      leftLimit, 
                                                      rightLimit, 
                                                      decimalPlacesAccuracy)
    
    % in case the interval limit points are given in incorrect (reverse) order, a value swap is needed                                                   
    if (leftLimit > rightLimit)
        [leftLimit, rightLimit] = swapNumbers(leftLimit, rightLimit);
    endif
    
    iterationsExecuted = 0;
    desiredAccuracy = 0.5 * 10^(-decimalPlacesAccuracy);

    if (aFunction(leftLimit)*aFunction(rightLimit) > 0) 
        error("bisectionMethod: The given interval does not meet the Bolzano's Theorem requirements. The product f(a)*f(b) must be non-positive!");         
    elseif (aFunction(leftLimit) == 0)
        root = leftLimit;
        return;
    elseif (aFunction(rightLimit) == 0)
        root = rightLimit;
        return;
    endif
     
    while ((rightLimit - leftLimit)/2 >= desiredAccuracy)
        iterationsExecuted++;
        middle = ((leftLimit + rightLimit)/2);
        if (aFunction(middle) == 0)
            root = middle;
            return;
        elseif (aFunction(leftLimit)*aFunction(middle) < 0)
            rightLimit = middle;
        else
            leftLimit = middle;
        endif
    endwhile
    root = double((rightLimit + leftLimit)/2);
endfunction