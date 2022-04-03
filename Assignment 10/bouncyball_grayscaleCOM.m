function [x,y] = bouncyball_grayscaleCOM(M,grayBoundary)
% Calculates the COM of the bouncy ball from the ball's grayscale values.
% Input M is an RGB image array
% Input grayBoundary contains the lower and upper thresholds of grayscale values.
% grayBoundary(1) is the lower bound, grayBoundary(2) is the upper bound.
% Output x is column number of the COM
% Output y is row number of the COM

% Converting RGB image array M into grayscale.
M = rgb2gray(M);

% Finding the row and column values of M that lie between the upper and
% lower bounds of grayBoundary.
[rowNum, colNum] = find(grayBoundary(1)<M & M<grayBoundary(2));

% Calculating the COM by finding the mean of the colNum and rowNum, and
% saving it into output x and y.
x = mean(colNum);
y = mean(rowNum);


