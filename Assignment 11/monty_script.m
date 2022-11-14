% monty_script.m

% Setting inputs
mazeImage = '10 by 10 orthogonal maze.png'; % maze image
row = 86; % initial row position
col = 58; % initial column position
s2c = 3; % steps to change in a direction
% Real-time visualization 'fast'
realTimeVis = 'fast'; 

% Initialising counter
noSteps = 0;

% Call upon MontyTheMouse.m 500 times
for i = 1:500
    fileName = 'Figure' + string(i);
    noSteps(i) = MontyTheMouse(mazeImage,row,col,s2c,realTimeVis);
    saveas(gcf,fileName,'jpeg')
    close all
end

% Printing histogram
histogram(noSteps,11)
xlabel("No. of steps")
ylabel("Count")
