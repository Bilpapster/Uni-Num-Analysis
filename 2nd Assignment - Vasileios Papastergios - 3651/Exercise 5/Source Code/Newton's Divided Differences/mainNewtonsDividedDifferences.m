n=10;
x=pi*cos((1:2:2*n-1)*pi/(2*n));
y=sin(x);

[f] = newtonsDividedDifferencesMethod(x, y);

numberOfTestingPoints = 200;
xValues = linspace(-pi, pi, numberOfTestingPoints);

axis([-4, 4, -1.5, 1.5]);
hold on;

for i = 1:numberOfTestingPoints
    yValues(i) = f(xValues(i));
endfor

% plots results
% the base points, the polynomial and the actual curve of sin(x) are ploted in the same figure

% plots the base points as filled black dots
plot(x, y, "color", 'k', '.');
hold on;

% plots the polynomial in green solid line
plot(xValues, yValues, "color", 'b');
hold on;

% plots the actual curve of sin(x) in magenda dash-dotted line
plot(xValues, sin(xValues), "color", 'm', "linestyle", '-.');
legend("base points (Chebyshev Polynomial roots)", "interpolating polynomial using Newtons Divided Differences", "sin(x)", "location", "southeast");

%uncomment  the following block for interpolation error plotting
#{ 
hold off;
errorValues = sin(xValues) - yValues;
plot(xValues, errorValues, "color", 'b');
legend("interpolation error for polynomial using Newtons divided Differences");
printf("Used %d points to calculate interpolation error. Max: %.6f ** Min: %.6f ** Mean: %.6f\n", numberOfTestingPoints, max(errorValues), min(errorValues), mean(errorValues));
#}