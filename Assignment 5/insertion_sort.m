function [t,v] = insertion_sort(v)
% This function is an insertion sort algorithm that sorts elements of vector v
% in descending order. Input v is the unsorted array, output v is the
% sorted array, and output t is the function's elapsed run time.

tic % Start timer

for j = 2:length(v) % Run the loop for one less time than the number of elements in v.
    key_element = v(j); % Identify the key element for each loop iteration
    i = j-1; % Indexing the element before the key element in vector v
    while i >= 1 && key_element > v(i) % While the index i is a positive integer and the
          % key element is greater than the element before it.
          v(i+1) = v(i); % Swap the key element and the element before it. 
          i = i-1; % Reset the index i to i-1 to check the elements before the current key element.
    end % end the while loop
    v(i+1) = key_element; % Reset the key-element for the next iteration.
end % end the foor loop

t = toc; % End timer, save elapsed time as variable t.

end

