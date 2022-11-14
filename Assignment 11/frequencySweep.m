function [f,amp] = frequencySweep(I1,I2,c,k,L,T,fL,fU,N,Np,Ns,vis)
% Takes in the system and solution parameters and reports the frequencies
% investigated and the resulting amplitude of the wrist at each frequency

% Input I1 is the moment of inertia of the wrist
% Input I2 is the moment of inertia of the mass damper
% Input c is the damping ratio
% Input k is the stiffness of the system
% Input L is the distance between the center of the wrist to the mass damper
% Input T is the torque N*m
% Input fL and fU are the lower and upper frequency bounds of the frequency sweep.
% Input N is the number of equally spaced steps simulated between the 
% frequency sweep bounds.
% Input Np is a scalar that represents the number of periods in each solution
% (at each frequency investigated) and is assumed to be positive and integer.
% Input Ns is a scalar that represents the minimum number of solution time 
% steps in each solution period and is assumed to be positive and integer.
% Input vis is a scalar Boolean (takes the value of true or false).

% Output f is a 1 x N vector that contains each of the frequencies investigated
% in units of Hz, starting with fL and ending with fU.
% Output amp is a 1 x N vector that contains the amplitude of the wrist for
% each frequency investigated.

% If the function does not have enough inputs, set the inputs to the given values
if nargin<12 % If the number of inputs is less than 12
    I1 = 5e-4; % moment of inertia of the wrist
    I2 = 2e-4; % moment of inertia of mass damper
    c = 0.1; % damping ratio
    k = 250; % stiffness of system
    L = .03; % Distance between center of the wrist to mass damper
    T = .1; % torque
    fL = 3; % lower bound of frequency sweep
    fU = 10; % upper bound of frequency sweep
    N = 50; % Number of steps between the bounds of the frequency sweep
    Np = 200; % number of periods
    Ns = 40; % number of step sin each solution period
    vis = true; % turn on visualisation
end

% Setting the lower and upper bound of the frequencies and the number of
% equally spaced steps between them
f = linspace(fL,fU,N);

% Setting the times that the simulation starts (timeStart) and ends (timeEnd)
timeStart = 0;
timeEnd = 1./f*Np;

for i = 1:length(f) % Investigating all the frequencies
    % Setting intial conditions
    initial_conditions = [0 0 0 0];
    % Enforcing a minimum number of time steps (Ns) in each solution period
    maxStep = 1./(f(i)*Ns);
    options = odeset('MaxStep',maxStep);
    % Solving the ODE, where t is the evaluation points and solutions is the solution
    [t,solutions] =  ode45(@massDamperEOMs,[timeStart timeEnd(i)],initial_conditions,options,T,f(i),I1,I2,L,k,c);
    % Extract angle of wrist, rad.
    theta1 = solutions(:,1);
    % Determine the amplitude from the previous period of the solution.
    theta1_prev = theta1(t>=(timeEnd(i)-1/f(i)));
    % Find the amplitude by subtracting max and min of theta1_prev and
    % convert the angle to degrees.
    amp(i) = rad2deg(max(theta1_prev)-min(theta1_prev));
     % When vis is true, plot theta1 in degrees as a function of time (s).
     if vis == true
        plot(t,theta1,'.') 
        xlabel('Time (s)')
        ylabel('\theta_1 (rad)')
        title(['Frequency: ',num2str(f(i)),' Hz'])
        drawnow
     end
end

end




