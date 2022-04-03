function msd_posVel(c,k,m,yi,vi,t_beg,t_end)
% c is the damping coefficient (units: kg/s)
% k is the spring constant (units: kg/s2 = N/m)
% m is the weight of the block.
% yi is the initial position of the system
% vi is the initial velocity of the system
% t_beg is the start time of the simulation (most often taken to be 0)
% t_end is the end time of the simulation.

% Using ode45 to solve the differential equation.
% Using function handle to call upon function msd.
[t,x] = ode45(@msd,[t_beg,t_end],[yi vi],[],c,k,m);

% Plotting x1 against t
plot(t,x(:,1),'b') % Make line blue
yyaxis left; % yyaxis creates chart with two y-axes
ylabel('Position (m)') % Position on the left
set(gca,'YColor','b') % Setting first y-axis label, y tick labels to blue
ylim([-20 30]) % Setting y-axis limits
hold on % Plot graph together

% Plotting x2 against t
plot(t,x(:,2),'r')
yyaxis right;
ylabel('Velocity (m/s)'); % Velocity on the right
set(gca,'YColor','r') % Setting second y-axis label, y tick labels to red
ylim([-4 6]); % Setting y-axis limits
xlabel('Time (s)') % Setting x-axis label
hold off % Stop holding

grid off % Grid off

end