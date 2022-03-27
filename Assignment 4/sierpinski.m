function sierpinski(x,y,xVertex,yVertex,N)
% This function returns a plot of a Sierpiński triangle-like pattern.

% Plot all the points on one graph
hold on;

% Plot the initial triangle using dots
plot(xVertex,yVertex,'.');

% Finds the second point from the initial start point.
for a = 1 % For the first iteration
random_integer = randi([1 3]); % Generate a random integer from 1 to 3
    switch random_integer % Executes a different group of statements depending on random_integer.
        case 1 % If random_integer = 1; from the initial point, go halfway in the direction of vertex 1
            x(a) = 0.5*x;
            y(a) = 0.5*y;
        case 2 % If random_integer = 2; from the initial point, go halfway in the direction of vertex 2
            x(a) = 0.5*x+.25;
            y(a) = 0.5*y+sqrt(3)/4;
        case 3 % If random_integer = 3; from the initial point go halfway in the direction of vertex 3
            x(a) = 0.5*x+.5;
            y(a) = 0.5*y;
    end % Ends the switch statement
end % Ends the first For loop for the first iteration.

% Finds the remainder of the N points.
for a = 2:N % For the next iterations up to iteration N.
random_integer = randi([1 3]); % Generate a random integer from 1 to 3
    switch random_integer % Executes a different group of statements depending on random_integer.
        case 1 % If random_integer = 1; from the previous point, go halfway in the direction of vertex 1
            x(a) = 0.5*x(a-1); 
            y(a) = 0.5*y(a-1);
        case 2 % If random_integer = 2; from the previous point, go halfway in the direction of vertex 2
            x(a) = 0.5*x(a-1)+.25;
            y(a) = 0.5*y(a-1)+sqrt(3)/4;
        case 3 % If random_integer = 3; from the previous point, go halfway in the direction of vertex 3
            x(a) = 0.5*x(a-1)+.5;
            y(a) = 0.5*y(a-1);
    end % Ends the switch statement
end % Ends the second For loop for iterations 2 to N.

% Plot all the points of the sierpinski triangle using dots.
plot(x,y,'.')

% Stop holding
hold off

end