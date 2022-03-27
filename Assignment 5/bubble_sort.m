function [t,v] = bubble_sort(v)
% This function is a bubble sort algorithm that sorts elements of vector v
% in descending order. Input v is the unsorted array, output v is the
% sorted array, and output t is the function's elapsed run time.

tic % Start timer

for i = 1:length(v)
    % Run the for loop for all the elements in unsorted array v.
    for j = 1:length(v)-i % Indexing the elements of array v up to the second to the last
        % If elements of unsorted array v are in the wrong order
        % switch them around
        if v(j) < v(j+1) % If the element in v is smaller than the next one
            a = v(j+1); % Set a temporary variable a to store the values of v(j+1)
            v(j+1) = v(j); % Swap the values of v(j+1) with v(j)
            v(j) = a; % Replace v(j) with the previous value of v(j+1) stored in a
        end % end the if loop
    end % end the second for loop
end % end the first for loop

t = toc; % End timer, save elapsed time as variable t.

end
