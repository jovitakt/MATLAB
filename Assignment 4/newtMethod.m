function [N,x] = newtMethod(x,tol)

% Initialising the number of iterations to 0
N = 0;
% Initialising difference to a value greater than the tolerance
difference = 50;

while difference>tol
    % Function
    y = (x-2)^2 + (x-3) - 10;
    % Derivative of function
    dy = 2*x - 3;
    % Calculating the new value of x using the Newton Raphson equation.
    x_new = x - y/dy;
    % Calculating the difference between consecutive guesses.
    difference = abs(x-x_new);
    % Updating the value of x
    x = x_new;
    % Updating the number of iterations
    N = N+1;
end

end

