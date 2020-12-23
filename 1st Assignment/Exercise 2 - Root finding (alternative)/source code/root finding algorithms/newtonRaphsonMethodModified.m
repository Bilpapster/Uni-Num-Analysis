function [root, iterationsExecuted] = newtonRaphsonMethodModified(aFunction, 
                                                                  itsDerivative, 
                                                                  itsSecondDerivative, 
                                                                  startingPoint, 
                                                                  decimalPlacesAccuracy)
                                                          
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
        x = x - aFunction(x)/itsDerivative(x) - 0.5*(aFunction(x)^2*itsSecondDerivative(x))/(itsDerivative(x)^3);
    until (abs(previous - x) < desiredAccuracy)

    root = x;
endfunction