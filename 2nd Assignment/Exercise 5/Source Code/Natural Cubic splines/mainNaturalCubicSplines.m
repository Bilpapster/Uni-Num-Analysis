% base points are set to be the Chebysev Polynomial's roots
n=10;
x=pi*cos((1:2:2*n-1)*pi/(2*n));
y=sin(x);

numberOfTestpoints = 200;
xValues = linspace(-pi, pi, numberOfTestpoints);

splineplot(x, y, numberOfTestpoints/n);
