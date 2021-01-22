function [returnValue] = trapezoidMethod(aFunction, leftLimit, rightLimit, numberOfSegments = 10)
    rangePerSegment = (rightLimit - leftLimit)/numberOfSegments;

    returnValue = 0;
    for i = 1:numberOfSegments-1
        returnValue += aFunction(leftLimit + i * rangePerSegment);
    endfor

    returnValue = (rangePerSegment/2) * (aFunction(leftLimit) + aFunction(rightLimit) + 2*returnValue);
end