function dNum = descrambler (sNum)
% Deletes every 3rd index in the array.
sNum(1:3:end) = [];
% Swaps even and odd indices
dNum(2:2:length(sNum)) = sNum(1:2:end);
dNum(1:2:length(sNum)) = sNum(2:2:end);
% Takes the last 6 indices and moves them to the front of the vector.
dNum = circshift(dNum,6);
% Subtracts 1 from every even index
dNum(2:2:end) = dNum(2:2:end)-1;
% Remove an equal number of indices from the left and right hand side of the vector to yield the 10-digit phone number 
n = (length(dNum) - 10)/2;
dNum = dNum(n+1:end-n);
end