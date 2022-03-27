function plotAFMdata(H,F,I,ss,saveName)
% H is a two dimensional matrix of height data
% F is a two dimensional matrix of friction data, 
% I is a two dimensional matrix of current response data,
% ss is a scalar describing the scan size of the data set,
% saveName is the name of data file to which the figure produced will be saved to

% Setting x and y vectors
dim = size(H); 
x = linspace(0,ss,dim(1)); 
y = x;

% Positioning the whole plot to the center of the screen
screenSize = get(0,'ScreenSize'); % Return property value of screen size
screenWidth = 1000; % Window size of 1000x460
screenHeight = 460;
scX1 = round((screenSize(3) - screenWidth)/2); % Find the central point
scY1 = round((screenSize(4) - screenHeight)/2); 
fig = figure('Position',[scX1 scY1 screenWidth screenHeight],...
 'Color','w','PaperPositionMode','auto'); % Putting the figure window to the center

% Friction overlaid Height 3D plot
axes('Position',[0.05 0.07 0.4 0.33]) % Specifying position, southwest
set(gca,'FontSize',10,'FontName','Arial') % Modifying font size and type
surf(x,y,H,F)
shading interp
axis tight % Each axis should extend no further than the domain, range, and height of the data
grid off % No grid
box on % Include bounding box
view([-45 65]) % Sprecifying elevation and azimuth
xlabel('nm') % Labelling the axes
ylabel('nm')
zlabel('nm')
title('Friction overlaid height') % Labelling the graph
colorbar1 = colorbar; % Include a color bar
title(colorbar1,'Friction (mV)') % Title on color bar

% Current overlaid Height 3D plot`
axes('Position',[0.55 0.07 0.4 0.33]) % Specifying position, southeast
set(gca,'FontSize',10,'FontName','Arial') % Modifying font size and type
surf(x,y,H,I)
shading interp
axis tight % Each axis should extend no further than the domain, range, and height of the data
grid off % No grid
box on % Include bounding box
view([-45 65]) % Sprecifying elevation and azimuth
xlabel('nm') % Labelling the axes
ylabel('nm')
zlabel('nm')
title('Current overlaid height') % Labelling the graph
colorbar2 = colorbar; % Include another color bar
title(colorbar2,'Current Response (V)') % Title on the second color bar

% Current as a function of friction
axes('Position',[0.08 0.6 0.4 0.35]) % Specifying position, northwest
set(gca,'FontSize',10,'FontName','Arial') % Modifying font size and type
plot(F,I,'k.') % Plot of current against friction, black dotted markers
xlabel('Friction (mV)') % Labelling the axes
ylabel('Current response (V)')
title('Current as a function of friction') % Labelling the graph

% Histogram of current response
axes('Position',[0.56 0.6 0.4 0.35]) % Specifying position, northeast
set(gca,'FontSize',10,'FontName','Arial') % Modifying font size and type
histogram(I(:),50) % Histogram function
xlim([-1 7]) % Specify a domain of -1 to 7
xlabel('Current response (V)') % Labellling the axes
ylabel('Counts')
title('Current histogram') % Labelling the histogram

% Saving the figure to the input file name saveName and closing the figure.
% Saving the figure as a jpeg with input name, resolution 300 pixels/inch
print(fig,saveName,'-djpeg','-r300') 
close(fig) % Closing the figure

end