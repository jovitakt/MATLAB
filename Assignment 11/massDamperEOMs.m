function dtheta = massDamperEOMs(t,x,T,f,I1,I2,L,k,c)
% massDamperEOMs stores the state-space representation of the EOMs.
% Input t is the time in seconds.
% Input x is 1x4 vector of system state [theta1 dtheta1 theta2 dtheta2]
% Input T is the torque N*m
% Input f is the frequency in Hz
% Input I1 is the moment of inertia of the wrist
% Input I2 is the moment of inertia of the mass damper
% Input L is the distance between the center of the wrist to the mass damper
% Input k is the stiffness of the system
% Input c is the damping ratio
% Output dtheta is the 4x1 vector of the new system state [theta1; dtheta1; theta2; dtheta2]

angular_frequency = 2*pi*f; % calculating angular frequency rad/s using the input frequency
dtheta(1) = x(2); % Saving the input system state dtheta1 into the first element of output vector dtheta
% Calculate dtheta(2) using a second-order differential equation
dtheta(2) = 1/I1*(T*cos(angular_frequency*t)-c*L^2*(x(2)-x(4))-k*L^2*(x(1)-x(3)));
dtheta(3) = x(4); % Saving the input system state dtheta2 into the third element of output vector dtheta
% Calculate dtheta(4) using a second-order differential equation
dtheta(4) = 1/I2*(T*cos(angular_frequency*t)-c*L^2*(x(4)-x(2))-k*L^2*(x(3)-x(1)));

% Transpose as a column vector
dtheta = dtheta';

end