clear
clc
close all

for rect = 1:10 % Producing 10 rectangular prisms
 % Randomise corner points.
 x0 = randi(10);
 y0 = randi(10);
 z0 = randi(10);
 % Create random prism lengths.
 W = randi(3);
 L = randi(3);
 T = randi(3);
 % Create a random 1x3 vector for the prism's color.
 c = rand(1,3);
 % Call upon rightRectPrism function
 rightRectPrism(x0,y0,z0,W,L,T,c)
end

% Labelling axes
xlabel('x')
ylabel('y')
zlabel('z')
% View 3 Dimension
view(3)