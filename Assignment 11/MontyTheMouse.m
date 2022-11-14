function noSteps = MontyTheMouse(mazeImage,row,col,s2c,realTimeVis)

% Output noSteps represents the total number of steps it took for Monty to reach an exit.
% Input mazeImage is the name of the .png maze image that Monty needs to solve.
% Inputs row and col are nonzero, positive, and integer scalars that represent 
% the starting row and column location of Monty
% Input s2c is a nonzero, positive, and integer scalar that represents the 
% number of steps Monty will take before randomly changing direction.
% Input realTimeVis controls real-time visualization of Monty and his
% history of positions.

% Debugging MontyTheMouse
if nargin < 5 % If number of inputs are less than 5
   mazeImage = '10 by 10 orthogonal maze.png'; % maze image
   row = 86; % initial row position
   col = 58; % initial column position
   s2c = 3; % steps to change in a direction
   % Real-time visualization: 'slow', 'fast', 'none'.
   realTimeVis = []; 
end

% Open mazeImage
loadMaze = imread(mazeImage); 
[mazeSize,~] = size(loadMaze(:,:,1)); % Get the size of the maze
mazeHistory = zeros(mazeSize);
surfaceHistory = surface(mazeHistory); % Creating surface from maze
shading interp
colormap (flipud(bone)); % Inverted bone colorscale to represent the number 
% of times Monty has visited a particular index
axis tight
hold on % Plot simultaneously

% Extracting the alpha data for the maze
[maze_image] = imread(mazeImage);
MontyMaze = image(maze_image);
mazeAlpha = ~logical(maze_image(:,:,1));
MontyMaze.AlphaData = zeros(mazeSize);
MontyMaze.AlphaData = mazeAlpha;

% Monty's starting point
curr_x = col;
curr_y = row;

% Initialise counter
noSteps = 0;
finish = false;

% Plotting MontyTheMouse
hold on % Plot simultaneously
MontyMouse = plot(curr_x,curr_y,'r.','MarkerSize',25);
axis tight
hold off % Stop holding
drawnow

% Maze algorithm
while finish == false
    noSteps = noSteps + 1; % Update counter
    title('No. of Steps:',num2str(noSteps)) % Update no of steps in the tile
    direction_x = randi([-1 1]); % Randomise x-direction (index -1, 0, +1)
    direction_y = randi([-1 1]); % Randomise y-direction (index -1, 0, +1)
    while direction_x == 0 && direction_y == 0 % Direction cannot be both zero
        % Monty must move
        direction_x = randi([-1 1]); % Randomise x-direction (index -1, 0, +1)
        direction_y = randi([-1 1]); % Randomise y-direction (index -1, 0, +1)
    end
    for step = 1:s2c % for s2c steps in the same direction
        curr_x = curr_x + direction_x;
        curr_y = curr_y + direction_y;
        % Update Monty's position
        MontyMouse.XData = curr_y;
        MontyMouse.YData = curr_x;
        % If the new location is out of maze matrix boundaries
        if curr_x == 0 || curr_x > mazeSize
           finish = true; % when maze is completed, update finish to true
           drawnow
           break % Break the loop to end.
        end 
        if mazeAlpha(curr_x,curr_y) == 1 % If Monty hits a black wall
           curr_x = curr_x - direction_x; % Move back to previous step
           curr_y = curr_y - direction_y;
           MontyMouse.XData = curr_y;
           MontyMouse.YData = curr_x;
           break % Break loop to reset noSteps counter.
        end
        % Update image data CData of Monty's history.
        mazeHistory(curr_x,curr_y) = mazeHistory(curr_x,curr_y) + 1; 
        surfaceHistory.CData = mazeHistory;
    % Visualisation
    if strcmp(realTimeVis,"slow")
        drawnow
    elseif strcmp(realTimeVis,"fast")
        drawnow limitrate
    else 
    end
    end
end






