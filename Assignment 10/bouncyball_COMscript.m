clear
clc
close all

% Open and read the reference video.
vidRead = VideoReader('Bouncing_ball.mp4');

% Initialise video writer, saving the new video as Bouncing_ball_COM_tracked.avi
vidWrite = VideoWriter('Bouncing_ball_COM_tracked.avi');
% Match the video frame rate to the reference vdieo
vidWrite.FrameRate = vidRead.FrameRate;
% Open video writer
open(vidWrite);

% Set up RGB boundary
rgbBoundary = [40 150; 50 170; 40 165]; % [Rlow Rhigh; Blow Bhigh; Glow Ghigh]
% Set up grayscale boundary
grayBoundary = [0 180]; % [Graylow Grayhigh]

% Initialising the x and y output vectors from functions bouncyball_rgbCOM
% and bouncyball_grayscaleCOM using empty vectors.
xRGB = [];
yRGB = [];
xGray = [];
yGray = [];

% Read video frame, calculate the COM of the bouncy ball and update the
% animation in the frame of the video.

while hasFrame(vidRead) % While the video has the frames of vidRead
    M_raw = readFrame(vidRead); % Read the frames of vidRead and save it into M_raw
    M = M_raw(75:1050,345:1000,:); % Crop M_raw to the target area and save it into M.

   % Call upon the bouncyball_rgbCOM function, save output into the xRGB
   % and yRGB vectors.
   [xRGB(end+1),yRGB(end+1)] = bouncyball_rgbCOM(M,rgbBoundary);
   
   % Call upon the bouncyball_grayCOM function, save output into the xGray
   % and yGray vectors.
   [xGray(end+1),yGray(end+1)] = bouncyball_grayscaleCOM(M,grayBoundary);

   % Setting up trailing points
   trailing_points = max(1,length(xRGB)-5+1);
   cla % Updating animation
    
   % RGB tracking
   subplot(1,2,1)
   hold on % Plot simultaneously
   image(M) % Open M as an image
   % Plot xRGB and yRGB with the trailing points, green line with circle
   % marker of size 5
   plot(xRGB(trailing_points:end),yRGB(trailing_points:end),'go-','MarkerSize',5)
   title('RGB tracking') % Add plot title
   hold off % Stop holding
   axis off image ij % Turn off axis, flip image
   text(20,50,['Frame: ',num2str(length(xRGB))]) % Add frame counter to video

   % Grayscale tracking
   subplot(1,2,2)
   hold on % Plot simultaneously
   image(M) % Open M as an image
   % Plot xGray and yGray with the trailing points, green line with circle
   % marker of size 5
   plot(xGray(trailing_points:end),yGray(trailing_points:end),'go-','MarkerSize',5)
   title('Grayscale tracking') % Add plot title
   hold off % Stop holding
   axis off image ij % Turn off axis, flip image

   drawnow % Update figures and process callbacks

   video = getframe(gcf); % Get frame
   writeVideo(vidWrite,video); % Write the animation to the video frame

end

close(vidWrite) % Close video
