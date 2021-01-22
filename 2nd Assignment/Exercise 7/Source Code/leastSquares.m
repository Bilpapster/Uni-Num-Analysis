function [xApproximate] = leastSquares(x, y, polynomialDegree = length(x)-1)
    if (length(x) != length(y))
        error("leastSquares: Sizes of base points x and y do not match!");
    endif

    for columnOfA = 1:polynomialDegree
        A(:, columnOfA) = x(:).^columnOfA;
    endfor

    A = [ones(rows(A), 1), A];

    ATranspose = transposeMatrixOf(A);
    if rows(y) == 1
        y = transposeMatrixOf(y);
    endif
    xApproximate = gaussSeidelMethod(ATranspose*A, ATranspose*y);
end