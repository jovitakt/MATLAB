function Mfilt = kernelFilter(M,kernel)
% Convolutes image data matrix M with a smaller kernel matrix. 

% Takes the size of M, separating into no of columns & no of rows
[nRows,nColumns] = size(M);

% Finds the length from the middle to the end of the kernel
middistance = (length(kernel)-1)/2;

%Preallocation of Mflit
Mfilt = zeros(nRows,nColumns);

% if the index of M(i,j) is less than 1, or greater than nrows or ncolumns
for i = 1:nRows % For all the rows of M
    for j = 1:nColumns % For all the columns of M
        sumValue = 0; % Initialising the sum
        for a = 1:size(kernel,1) % Looping through the kernel rows
            Mrow = i + a - middistance - 1; % Indexing the matrix M with respect to the kernel
            for b = 1:size(kernel,2) % Looping through the kernel columns
                Mcol = j + b - middistance - 1; % Indexing the matrix M with respect to the kernel
                if Mrow >= 1 && Mcol >= 1 && Mrow <= nRows && Mcol <= nColumns
                   % If Mrow is greater than or equal to 1
                   % and Mcol is greater than or equal to 1
                   % and Mrow is less than or equal to nRows
                   % and Mcol is less than or equal to nColumns
                   sumValue = sumValue + M(Mrow,Mcol)*kernel(a,b); 
                   % Multiply the matrix element and the corresponding kernel element
                   % Updating the sumValue with the new value every loop
                end
            end
        end
        Mfilt(i,j) = sumValue; % Saving sumValue into matrix Mfilt
    end
end
