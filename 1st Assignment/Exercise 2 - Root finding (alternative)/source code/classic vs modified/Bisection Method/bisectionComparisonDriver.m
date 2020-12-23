f = @(x) 94*((cos(x))^3)-24*cos(x)+177*((sin(x))^2)-108*((sin(x))^4)-72*((cos(x)^3))*(sin(x)^2)-65; 

compareBisectionMethodVersions(f, 0, 1);
compareBisectionMethodVersions(f, 1, 2);
compareBisectionMethodVersions(f, 2, 3);