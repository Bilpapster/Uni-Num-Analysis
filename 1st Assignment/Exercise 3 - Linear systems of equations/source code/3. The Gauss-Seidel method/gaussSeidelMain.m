n=10;
matrixA = zeros(n,n);
xInitial = zeros(1, n);

for i=1:n-1
  matrixA(i,i)=5;
  matrixA(i,i+1)=-2;
  matrixA(i+1,i)=-2;
end
matrixA(n,n)=5;
b=zeros(n,1);

b(1)=3;

for i=2:n-1
  b(i)=1; 
end
b(n)=3;

tic();
x = gaussSeidelMethod(matrixA, b, xInitial, 5)
toc()
