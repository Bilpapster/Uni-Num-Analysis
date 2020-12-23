g = @(a, b, d) (log10(b-a) + d)/log10(2);
f = @(x) e.^(sin(x).^3) + x.^6 - 2.*x.^4 - x.^3 - 1;
f_derivative = @(x)  3.*e.^(sin(x).^3).*(sin(x).^2).*cos(x) + 6.*x^5 - 8.*x.^3 - 3.*x.^2;
f_second_derivative = @(x) 9.*e.^sin(x).^3.*cos(x).^2.*sin(x).^4-3.*e.^sin(x).^3.*sin(x).^3+6.*e.^sin(x).^3.*cos(x).^2.*sin(x)+30.*x.^4-24.*x.^2-6.*x;

desiredAccuracy =0.5*10^(-5);
x = 0.7;
iterationsExecuted = 1;
ei(1)= 0.7;


%#{
do 
  iterationsExecuted++;
  previous = x;
  x = x - (4*f(x)/f_derivative(x))
  error = ei(iterationsExecuted) = abs(x)
  rate = ei(iterationsExecuted)/ei(iterationsExecuted-1)^2
until (abs(previous - x) < desiredAccuracy || f(x) == 0)

root = x;
%#}
