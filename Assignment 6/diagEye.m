function B = diagEye(A)
% Creates a new matrix B with a size of the minimum dimension of matrix A
% Matrix B has diagonal elements equivalent to the diagonal elements in A

% Set a temporary value that takes the sum of the diagonals of A
temp = sum(diag(A));

% Take the size of A, separating into no of columns and no of rows
[nRows,nCols] = size(A);
% Take the smallest of dimension and save it as szB
szB = min(nRows,nCols);

% Create a temporary array tempB of size 1 by szB
tempB = zeros(1,szB);
% Replace the values of tempB with temp (sum of the diagonals in A)
tempB(1:szB) = temp;

% Save the values of tempB in the diagonals of szB-by-szB matrix B.
B = diag(tempB);

end