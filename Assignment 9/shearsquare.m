function shearsquare(k)
% where k is the state number

% Initial state
square_size = 2^(k+1); % Create the side length of the big square
inner_square = 2^(k+1)/2; % Create the side length of the inner square
centerStart = (square_size-inner_square)/2 + 1; % Positioning the inner square to the center
centerEnd = centerStart + inner_square - 1;
square_board = zeros(square_size+1); % Fill big square with zeros (black)
square_board(centerStart:centerEnd,centerStart:centerEnd) = ones; % Fill small square with ones (white)

% Writing the video
v = VideoWriter('my_shear_square.avi'); % Save video as my_shear_square.avi
v.FrameRate = 1; % Setting frame rate as 1 fps
open(v) % Opening video writer

% Printing the square board
s = surface(square_board,'edgecolor', 'none');
colormap gray, axis off % Black and white colors
pause(1); % Pause 1 second for the iteration

for j = 1:8 % Preparing the iterations
    square_board = alternate(j); % Call upon function 'alternate'
    s.CData = square_board;
    pause(1); % Pause 1 second in between iterations
    video = getframe(gcf);
    writeVideo(v,video) % Writing the video
end

close(v) % closing video writer

function [square_board] = alternate(k)
% where k is the state number 
if k == 1
    % If k = 1, return the initial state
    square_size = 2^(8+1);
    inner_square = 2^(8+1)/2;
    centerstart = (square_size-inner_square)/2 + 1;
    centerend = centerstart + inner_square - 1;
    square_board = zeros(square_size+1);
    square_board(centerstart:centerend,centerstart:centerend) = ones;
else % If k is not = 1, start shifting
    square_board = alternate(k-1); 
    div = 512 / 2^k; % Creating a 'division', the width of each block shifted.
    if mod(k,2)==0 % For the even iterations, shift horizontally
        for i = 1:2^k-1
            start = 1 + (i-1)*div;
            if mod(i,2)==0 % Even rows, shift to the right
                square_board(start:i*div,:) = circshift(square_board(start:i*div,:),div/2,2);
            else % Odd rows, shift to the left
                square_board(start:i*div,:) = circshift(square_board(start:i*div,:),-div/2,2);
            end
        end
    else % For the odd iterations, shift vertically
        for i = 1:2^k-1
            start = 1 + (i-1)*div;
            if mod(i,2)==0 % Even columns, shift up
                square_board(:, start:i*div) = circshift(square_board(:, start:i*div),-div/2,1);
            else  % Odd columns, shift down
                square_board(:, start:i*div) = circshift(square_board(:, start:i*div),div/2,1);
            end
        end
    end    
end

end
end
