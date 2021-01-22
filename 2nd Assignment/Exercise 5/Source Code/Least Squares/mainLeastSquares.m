% constructs arrays x and y containing the coordinates of the base points
% base points are selected to be the Chebyshev Polynomial's roots
n=10;
x=pi*cos((1:2:2*n-1)*pi/(2*n));
y=sin(x);

% fills in the vector containing the factors of the least squares polynomial
% by default, the polynomial rerurned has degree n-1, where n is the number of base points
% in our case, we have 10 base points, so a degree 9 polynomial is returned 
[coefficients] = leastSquares(x, y);

% initializes the x coordinate of test points, in order to plot the found polynomial
% in the same figure, we are going to plot the actual curve of sin(x), as well
numberOfTestPoints = 200;
xValues = linspace(-pi, pi, numberOfTestPoints);

% initializes the y coordinates of the test points, used for plotting
% for each one of the testing points, we evaluate the actual y coordinate and the 
% coordinate given by the least squares polynomial
for i=1:numberOfTestPoints
    % constructs the y coordinates for the actual curve of sin(x)
    yActual(i) = sin(xValues(i));

    % constructs the y coordinates for the approximating polynomial
    yValues(i) = coefficients(1);
    for unknown = 2:length(coefficients)
        yValues(i) += coefficients(unknown)*xValues(i)^(unknown - 1);
    endfor

endfor

% plots results
% the base points, the polynomial and the actual curve of sin(x) are ploted in the same figure

 % plots the base points as filled black dots
plot(x, y, "color", 'k', '.');
hold on;

% plots the polynomial in green solid line
plot(xValues, yValues, "color", 'g');
hold on;

% plots the actual curve of sin(x) in magenda dash-dotted line
plot(xValues, yActual, "color", 'm', "linestyle", '-.');
legend("base points (Chebyshev Polynomial roots)", "least squares polynomial (degree 9) for sin(x)", "sin(x)", "location", "southeast");

% uncomment the following for interpolation error visualization
#{
hold off;
plot(xValues, yActual - yValues, 'g');
legend("interpolation error for least squares polynomial");
#}
