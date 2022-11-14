clear
clc
close all

% Setting the inputs
I1 = 5e-4; % moment of inertia of the wrist
I2 = 2e-4; % moment of inertia of mass damper
c = [0.1 1 10]; % damping ratio
k = 250; % stiffness of system
L = .03; % Distance between center of the wrist to mass damper
T = .1; % torque
fL = 3; % lower bound of frequency sweep
fU = 10; % upper bound of frequency sweep
N = 50; % Number of steps between the bounds of the frequency sweep
Np = 200; % number of periods
Ns = 40; % number of step sin each solution period
vis = false; % turn off visualisation

% Call upon frequencySweep for all values of c.
for j = 1:length(c)
    [f{j},amp{j}] = frequencySweep(I1,I2,c(j),k,L,T,fL,fU,N,Np,Ns,vis);
end

% Plotting the outputs of frequencySweep for all values of c.
hold on
for j = 1:length(c)
    plot(f{j},amp{j},'o-','LineWidth',1)
end
hold off

% Setting labels and legends
xlabel('Frequency (Hz)')
ylabel('Wrist amplitude (\circ)')
legend('c = 0.10 N-s/m', 'c = 1.0 N-s/m', 'c = 10. N-s/m')