function dy = msd(t,y,c,k,m)
% Function that holds the differential functions

% Preallocating the differential function.
dy = zeros(2,1);

% Differential equations
dy(1) = y(2);
dy(2) = (-c.*y(2)-k.*y(1))./m;

end