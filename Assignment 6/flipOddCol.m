function B = flipOddCol (A)
% Reverse the elements for every odd-indexed column of A, saving the new
% matrix as matrix B.

% Set a temporary array temp, index the odd columns of A
temp = A(:,1:2:end);
% Reverse the elements of temp using flip
temp = flip(temp);
% Replace the odd columns of A with the values of temp
A(:,1:2:end) = temp;

% Save the new matrix as matrix B
B = A;
end
