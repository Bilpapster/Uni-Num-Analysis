f = @(x) 94*((cos(x))^3)-24*cos(x)+177*((sin(x))^2)-108*((sin(x))^4)-72*((cos(x)^3))*(sin(x)^2)-65; 

compareSecantMethodVersions(f, 0, 0.5, 0.75);
compareSecantMethodVersions(f, 0.9, 1.1, 1.2);
compareSecantMethodVersions(f, 1.5, 1.8, 2.3);
