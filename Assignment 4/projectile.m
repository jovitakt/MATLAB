function [x,y] = projectile(g,c,x0,y0,vx0,vy0,tstep) 
% {Simulates the path of a projectile launched from an initial position of
% (x,y) = (x0,y0) and with an initial velocity of (vx, vy) = (vx0, vy0)}

% Initial input values
x(1) = x0;
y(1) = y0;
vx(1) = vx0;
vy(1) = vy0;

% Set t = 1 for first state
t = 1;

% While loop condition is that calculation ends once y becomes negative
while min(y)>=0
    % Acceleration at t
    ax(t) = -c*vx(t)*(sqrt(vx(t)^2+vy(t)^2));
    ay(t) = -g-c*vy(t)*(sqrt(vx(t)^2+vy(t)^2));
    % {Velocity at next state; velocity at current state + acceleration at
    % current state * tstep}
    vx(t+1) = vx(t) + ax(t)*tstep;
    vy(t+1) = vy(t) + ay(t)*tstep;
    % {Displacement at next state; displacement at current state velocity
    % at current state * tstep}    
    x(t+1) = x(t) + vx(t)*tstep;
    y(t+1) = y(t) + vy(t)*tstep;
    % Updating the next state
    t = t+1;
end

end