function [returnValue] = simpsonMethod(aFunction, leftLimit, rightLimit, numberOfSegments = 10)

    if (mod(numberOfSegments, 2) != 0)
        printf("Exception in simpsonMethod: number of segments is odd. AI will transform %d to %d, in order to proceed\n", numberOfSegments, ++numberOfSegments);
    endif

    rangePerSegment = (rightLimit - leftLimit)/numberOfSegments;
    returnValue = aFunction(leftLimit) + aFunction(rightLimit);

    for segment = 1:2:numberOfSegments
        returnValue += 4 * aFunction(leftLimit + segment * rangePerSegment);
    endfor

    for segment = 2:2:numberOfSegments-1
        returnValue += 2 * aFunction(leftLimit + segment * rangePerSegment);
    endfor

    returnValue *= rangePerSegment/3;
end