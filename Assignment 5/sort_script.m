vector_length = linspace(50,15000,20); % Generate a vector of length 20 from 50 to 1500.
vector_length = ceil(vector_length); % Makes the elements of vector_length all integers.

t_bubble = zeros(1,20); % Pre-allocation of t_bubble
for i = 1:length(vector_length) % Repeat the loop 20 times
    v = rand(1,vector_length(i)); % Generate a vector v of random integers of size 1 by vector_length(i).
    [t_bubble(i),v] = bubble_sort(v); % Run bubble sort function
end % end for loop

plot(vector_length,t_bubble,'-o') % Plots vector length against sort time for bubble sort
hold on % Plot graph together

t_insertion = zeros(1,20); % Pre-allocation of t_insertion
for i = 1:length(vector_length) % Repeat the loop 20 times
    v = rand(1,vector_length(i)); % Generate a vector v of random integers of size 1 by vector_length(i).
    [t_insertion(i),v] = insertion_sort(v); % Run insertion sort function
end % end for loop

plot (vector_length,t_insertion,'-o') % Plots vector length against sort time for insertion sort
hold on % Plot graph together

t_sort = zeros(1,20); % Pre-allocation of t_sort
for i = 1:length(vector_length) % Repeat the loop 20 times.
    v = rand(1,vector_length(i)); % Generate a vector v of random integers of size 1 by vector_length(i).
    tic % Start timer for sort
    sort(v,"descend") % Runs MATLAB built-in sort function
    t_sort(i) = toc; % End timer for sort
end % end for loop

plot (vector_length,t_sort,'-o') % Plots vector length against sort time for built-in sort

% Labelling the axes
xlabel("Vector length")
ylabel("Sort time (s)")
% Creating a legend
legend("Bubble sort","Insertion sort","Built-in sort","Location","northwest")

hold off % stop holding