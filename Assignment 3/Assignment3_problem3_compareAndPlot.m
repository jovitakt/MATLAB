% Number of terms 0<n<3000
n = 0:3000;

% pre-allocating t_1, initialising it to zero
t_1 = zeros(1,3000);
for count = 1:3001
    % for indices of n
    % giving element-wise values to t_1
    t_1(count) = cosSeriesFor(pi,n(count));
end

% pre-allocating t_2, initialising it to zero
t_2 = zeros(1,3000);
for count = 1:3001
    % for indices of n
    % giving element-wise values to t_2
    t_2(count) = cosSeriesVect(pi,n(count));
end

% Plot number of terms against time elapsed for cosSeriesFor
% Logarithmic y-axis
semilogy(n,t_1)
% Labelling the axes
xlabel("Number of Terms")
ylabel("Computation time (s)")
% Creating a legend
legend("For loop","Vectorization")
% Plot graph together
hold on

% Plot number of terms against time elapsed for cosSeriesVect
% Logarithmic y-axis
semilogy(n,t_2)
% Creating a legend
legend("for loop","vectorization",'Location','southeast') 
hold off
