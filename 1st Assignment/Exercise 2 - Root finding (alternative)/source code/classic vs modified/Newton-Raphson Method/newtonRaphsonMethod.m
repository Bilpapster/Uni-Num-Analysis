#{
A script-function implementing the classic Newton-Raphson algorithm for root-finding of an one-variable function.

Takes as parameters: 
  - an one-variable function
  - its first derivative 
  - an initial point to start iterations from
  - the desired accuracy, described in decimal places on the claculated root, in relation to the actual root.
  - (optionally) the multiplicity of the wanted root (in case it is known). The root multiplicity is set by default to 1.
  
Returns the root found, as well as the number of iterations executed, in order to reach that root.
#}

function [root, iterationsExecuted] = newtonRaphsonMethod(aFunction,
                                                          itsDerivative, 
                                                          startingPoint, 
                                                          decimalPlacesAccuracy,
                                                          rootMultiplicity = 1)
                                                          
    iterationsExecuted = 0;
    if (aFunction(startingPoint) == 0)
        root = startingPoint;
        return;
    endif
    
    desiredAccuracy =0.5*10^(-decimalPlacesAccuracy);
    x = startingPoint;
     
    do 
        iterationsExecuted++;
        previous = x;
        x = x - (rootMultiplicity*aFunction(x)/itsDerivative(x));
    until (abs(previous - x) < desiredAccuracy*abs(x) || aFunction(x) == 0)

    root = x;
endfunction