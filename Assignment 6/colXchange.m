function B = colXchange(A)
% Switch the odd and even columns of matrix A and save it as matrix B.
% If there are more odd columns than there are even columns, leave the last
% odd column of A.

% Take the size of A, separating into no of columns and no of rows
[~,nCols] = size(A);
% Round down no of columns into the closest even integer
szB = 2*(floor(nCols/2));

% Save the values of matrix A into matrix B
B = A;
% For the greatest possible even number of columns, swap the odd and even
% columns of A.
B(:,1:2:szB) = A(:,2:2:szB); % Save the even rows of A into the odd rows of B
B(:,2:2:szB) = A(:,1:2:szB); % Save the odd rows of A into the even rows of B

end