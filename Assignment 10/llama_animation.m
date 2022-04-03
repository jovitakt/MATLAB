clear
close all
clc

% Create a figure
fig1 = figure;

% Create 2 sets of axis, setting the figure as the parent.
axis1 = axes('Parent',fig1);
axis2 = axes('Parent',fig1);

% Turn off visibility for both axes
set(axis1,'Visible','off');
set(axis2,'Visible','off');

% Writing the video
v = VideoWriter('Rolling_in_the_deep.avi'); % Save video as Rolling_in_the_deep.avi
v.FrameRate = 5; % Setting frame rate as 5 fps
open(v) % Opening video writer

% Opening background image
background = imread('under the sea.jpg');
imshow(background,'Parent',axis1) % Open background image on axis 1

for i = 1:24 % For 24 iterations
    % Getting the alpha data for the llama
    [llama, ~, llamaAlpha] = imread('llama.png');
    % Creating the rotating motion for the llama (30 degree cw rotation)
    I = imrotate(llama,-30*i,"crop");
    llama_image = imshow(I,'Parent',axis2); % Open llama on axis 2
    % Resizing and repositioning the llama
    llama_image.XData = [500 1700];
    llama_image.YData = [400 1479];
    % Rotating the alpha data of the llama along with the llama
    llama_image.AlphaData = imrotate(llamaAlpha,-30*i,"crop");
    % Pausing between iterations
    pause(0.2)
    video = getframe(gcf); % Get frames
    writeVideo(v,video) % Writing the video
end

close(v) % Closing video writer