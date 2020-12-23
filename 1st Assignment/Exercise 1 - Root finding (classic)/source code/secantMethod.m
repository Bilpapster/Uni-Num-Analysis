#{
A script-function implementing the classic secant algorithm for root-finding of an one-variable function.

Takes as parameters: 
  - an one-variable function
  - two initial points to start iterations from
  - the desired accuracy, described in decimal places on the claculated root, in relation to the actual root.
  
Returns the root found, as well as the number of iterations executed, in order to reach that root.
#}

function [root, iterationsExecuted] = secantMethod(aFunction, 
                                                   startingPoint1, 
                                                   startingPoint2,
                                                   decimalPlacesAccuracy)
                                                          
    iterationsExecuted = 0;
    if (aFunction(startingPoint1) == 0)
        root = startingPoint1;
        return;
        
    elseif (aFunction(startingPoint2) == 0)
        root = startingPoint2;
        return;
    endif
    
    desiredAccuracy =10^(-decimalPlacesAccuracy);
    
    x = startingPoint1;
    previous1 = startingPoint2;
     
    do 
        iterationsExecuted++;
        previous2 = previous1;
        previous1 = x;
        x = previous1 - (aFunction(previous1)*(previous1 - previous2))/(aFunction(previous1)-aFunction(previous2));
    until (abs(previous1 - x) < desiredAccuracy*abs(x) || aFunction(x) == 0)

    root = x;
endfunction