A = [0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0;
     0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0;
     1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0;
     0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1;
     0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0;];
     

n = rows(A);
q = 0.15;
     
for row = 1:n
  sumOfRow(row) = sum(A(row,:));
endfor

for i = 1:n
  for j = 1:n
    G(i, j) = (q/n) + (A(j, i)*(1-q))/sumOfRow(j);
  endfor
endfor

% utilizes the power method function to calculate the maximum eigenvalue and the associated eigenvector
[eigenvalue, eigenvector] = powerMethod(G);

% normalizes the eigenvector with its sum, in order to represent probabilities that sum to 1
eigenvector /= sum(eigenvector);

% prints result in an easy-on-the eye format, nothing special
printf("The maximum eigenvalue of the matrix is %.3f. \n\n", eigenvalue);

for page = 1:length(eigenvector)
  printf("The probability that the user is now in page %2d is %f\n", page, eigenvector(page));
endfor


[sorted, indices] = sort(eigenvector);
for page = length(eigenvector):-1:1
  printf("Page %2d (%f)\n", indices(page), sorted(page));
endfor
