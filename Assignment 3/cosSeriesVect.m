function [t, val] = cosSeriesVect(x,n)
% Start timer
tic
% For 0<n<3000, set n to 3000
i = 0:n;
% Array operation for the infinite series of cos(x)
val = ((-1).^i).*(x.^(2*i))./factorial(2*i);
% Sum of columns in array val, to give the value of cos(x)
val = sum(val);
% End timer
% Set t = total elapsed time for the function
t = toc;