function [x1,y1]=splineplot(x, y, testPointsPerSegment)
  n=length(x);
  coefficientsMatrix=naturalCubicSplines(x,y);
  x1=[]; y1=[];

  for i=1:n-1
    xs=linspace(x(i),x(i+1),testPointsPerSegment+1);
    dx=xs-x(i);
    ys=coefficientsMatrix(i,3)*dx;
    ys=(ys+coefficientsMatrix(i,2)).*dx;
    ys=(ys+coefficientsMatrix(i,1)).*dx+y(i);
    x1=[x1; xs(1:testPointsPerSegment)']; 
    y1=[y1;ys(1:testPointsPerSegment)'];
  end

  axis([-4, 4, -1.5, 1.5]);
  hold on;

  x1=[x1; x(end)];y1=[y1;y(end)];
  plot(x, y, '.', "color", 'k', "linewidth", 1.5);
  hold on;

  plot(x1, y1, "color", 'c');
  hold on;

  % plots the actual curve of sin(x) in magenda dash-dotted line
  plot(x1, sin(x1), "color", 'm', "linestyle", '-.');
  legend("base points (Chebyshev Polynomial roots)", "interpolating polynomial using natural cubic splines", "sin(x)", "location", "southeast");
  
  %uncomment for interpolation error plotting
  #{ 
  hold off;
  plot(x1, sin(x1) - y1, "color", 'c');
  legend("interpolation error for natural cubic splines");
  #}
endfunction