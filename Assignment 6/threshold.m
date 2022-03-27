function B = threshold(A,lob,hib)
% Replace all entries in matrix A lower than lob with lob, and those
% greater than hib with hib, such that lob is less than or equal to hib.
% Saves the new matrix as matrix B.

% For all elements in A greater than hib, replace with hib.
A(A>hib) = hib;
% For all elements in A less than lon, replace with lob.
A(A<lob) = lob;

% Saves matrix B with the values of the new matrix A.
B = A;
end