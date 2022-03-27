function B = stripes (n)
% Creates a matrix B of size n by n where odd rows are all zeros and even
% row are all ones

% Create a n by n zero matrix, save it as matrix B
B = zeros(n);
% Replace the all the elements in the even rows of matrix B with 1s.
B(2:2:end,:) = 1;

end