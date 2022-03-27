% Input values
g = 9.81; % m/s^2, acceleration due to gravity
c = 0.002; % Ns/m, damping caused by air resistance
x0 = 0; % m, initial x position
y0 = 1; % m, initial y position
v0 = 820; % m/s, initial velocity
tstep = 0.01; % s, time step of the simulation

% Plots the graphs simultaneously
hold on

for theta = linspace(5,85,10) % For 10 divisions of theta from 5 to 85.
    % Computes for the x-component of initial velocity given the initial velocity
    vx0 = v0*cosd(theta);
    % Computes for the y-component of initial velocity given the initial velocity
    vy0 = v0*sind(theta);
    % Calls projectile.m function for the inputs above
    [x,y] = projectile(g,c,x0,y0,vx0,vy0,tstep);
    % Plots the results of the function, style is black dots
    plot(x,y,'k.')
end

% Label the graph axes clearly
xlabel ("x position (m)")
ylabel ("y position (m)")

% Sets the axis limits to equal the range of the data.
axis tight
% stop holding
hold off
