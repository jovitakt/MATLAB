function [x,y] = edgeDetect(M,threshold)

x = [];
y = [];

for row = 2:(size(M,1)-1) % Loop through the rows 
    % Starting from 2 and ending at end-1 to avoid invalid indexes when
    % checking neighbors
    for col = 2:(size(M,2)-1) % Loop through the columns
        % If element under consideration must be greater than or equal to threshold (lighter than threshold)
        if M(row, col)>=threshold
           maincriteria = 1; % First criteria is met
           % Initialising consideration = 0 before checking neighbors
           consideration = 0;
            % Checking neighbors
            if M(row, col-1)<threshold % If neighbour is less than threshold
               consideration = consideration + 1; % Add 1 to consideration
            end
            % Check for all neighbors (row+-1,col+-1)
            if M(row+1, col-1)<threshold
               consideration = consideration + 1;
            end
            if M(row+1, col)<threshold
              consideration = consideration + 1;
            end
            if M(row+1, col+1)<threshold
               consideration = consideration + 1;
            end
            if M(row, col+1)<threshold
               consideration = consideration + 1;
            end
            if M(row-1, col+1)<threshold
               consideration = consideration + 1;
            end
            if M(row-1, col)<threshold
               consideration = consideration + 1;
            end
            if M(row-1, col-1)<threshold
               consideration = consideration + 1;
            end
            % If first criteria is met, and at least 1 neighbor pixel has a value less than threshold
            if maincriteria == 1 && consideration >= 1
            isEdge = 1; % Then it is an edge pixel
                if isEdge == 1 % If it is an edge pixel
                x(end+1) = row; % Save the row index
                y(end+1) = col; % Save the column index
                end
            end
        end
    end
end