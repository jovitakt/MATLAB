clear
clc
close all

for stars = 1:10 % Generate 10 stars
    % Generate random location center points.
    x0 = 10+20*rand;
    y0 = 10+20*rand;
    % Generate random inner and outer radius.
    d_inner = 1+2*rand; % d_inner has to be smaller than d_outer
    d_outer = 4+4*rand;
    % Generate random theta.
    theta = 2*pi*rand;
    % Generate 1 x 3 vectors as random colors for the stars.
    c = rand(1,3);
    % Call function fivePointedStar
    fivePointedStar(x0,y0,d_inner,d_outer,theta,c)
end

% Label axes
xlabel('X-axis') 
ylabel('Y-axis')
