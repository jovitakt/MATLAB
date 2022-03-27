function spirograph (R, r, d)
% {This function takes the inputs of R, r and d and returns the plot of the spirograph}

% Prepares the input value of theta to calculate the x and y values of the plots of the spirograph
theta = 0:0.001:(10*pi); 

% Calculates the x and y values of the plots of the spirograph
x = (R+r)*cos(theta)+d*cos((R+r)/r*theta);
y = (R+r)*sin(theta)-d*sin((R+r)/r*theta);

% Plots the spirograph
plot(x,y)
end