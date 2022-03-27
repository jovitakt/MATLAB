function [t, val] = cosSeriesFor(x,n) 
% Start timer
tic
% Initialise val = 0
val = 0;
% For loop
for i = 0:n % For 0<n<3000, set n to 3000
    % Infinite series of cos
    current_val = ((-1)^i)*(x^(2*i))/factorial(2*i);
    % Cumulative sum of the terms of the cos series
    val = val + cumsum(current_val);
end
% End timer
% Set t = total elapsed time for the function
t = toc;
