function [root, iterationsExecuted] = secantMethodModified(aFunction, 
                                                           startingPoint1, 
                                                           startingPoint2, 
                                                           startingPoint3, 
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
    
    x_n1 = startingPoint1;
    x_n2 = startingPoint2;
    x = startingPoint3;
     
    do 
        iterationsExecuted++;
        x_n = x_n1; 
        x_n1 = x_n2;
        x_n2 = x;
        q = calculateFraction(aFunction, x_n, x_n1);
        r = calculateFraction(aFunction, x_n2, x_n1);
        s = calculateFraction(aFunction, x_n2, x_n);
        x = x_n2 - (r*(r-q)*(x_n2 - x_n1) + (1-r)*s*(x_n2 - x_n))/((q-1)*(r-1)*(s-1));
    until (abs(x_n2 - x) < desiredAccuracy || aFunction(x) == 0)

    root = x;
endfunction