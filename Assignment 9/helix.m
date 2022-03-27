clear
clc
close all

% Creating 5000 data points to create smooth curve
t = linspace(0,20,5000); % 5000 equally spaced points between 0 and 20.

% Equations
x = cos(t);
y = sin(t);
z = t;

% Color map
color1 = [0 44 119]./255; % Penn blue
color2 = [152 30 50]./255; % Penn red

for i = 1:3 % 3 iterations red, green, blue
    % Creating smooth gradient for each of the color components
    colormap(:,i) = linspace(color1(i),color2(i),length(z))';
end % end loop

% Plotting the helix using 3D scatter plot
helix_plot = scatter3(x,y,z,10,colormap,'filled'); % Set color to colormap, fill, marker size 10

camproj('perspective') % Perspective view projection
% Larger than default tick labels and axis labels
set(gca,'FontSize',14)
% Axis labels
xlabel('x')
ylabel('y')
zlabel('z')

grid on % grid