function [x,y] = bouncyball_rgbCOM(M,rgbBoundary)
% Calculates the COM of the bouncy ball from the ball's RGB values.
% Input M is an RGB image array
% Input rgbBoundary contains the lower and upper thresholds of the RGB color channels.
% Input rgbBoundary has 2 columns and 3 rows (one each for R, G and B)
% Each column stores the lower and upper thresholds of each color channel.
% Output x is column number of the COM
% Output y is row number of the COM

for i = 1:3 % Going through the R, G, B components of M
    % Finding the locations of the pixels of M that lie between the upper and
    % lower bounds of rgbBoundary, for each R, G, B channel respectively.
    location(:,:,i) = M(:,:,i) >= rgbBoundary(i,1) & M(:,:,i) <= rgbBoundary(i,2);
end

% Adding all the values of location along the 3rd dimension
% Convert the array into a logical array
location = logical(sum(location,3));

% Finding the locations of the pixels of M that satisfy all the color
% thresholds for the R, G, B channels.
[rowNum, colNum] = find(location);

% Calculating the COM by finding the mean of the colNum and rowNum, and
% saving it into output x and y.
x = mean(colNum);
y = mean(rowNum);
