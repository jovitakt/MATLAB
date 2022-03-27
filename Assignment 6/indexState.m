function [nextState] = indexState(currentState,liveNeighbors)
% This function takes in the value of the index of state under consideration
% and the number of live neighbors around it and decides, based on the Game
% of Life rule set, if the new state of the index should be alive (1) or dead (0). 

% Initialise nextState as currentState
nextState = currentState;

% Any dead index with exactly three live neighbors becomes a live cell.
if currentState == 0
    if liveNeighbors == 3
        nextState = 1;
    else
        nextState = 0; % If not, it remains dead.
    end
end

% For the cases with a live index
if currentState == 1
    % Any live index with 3 or more live neighbors dies.
    if liveNeighbors > 3
        nextState = 0;
    % Any live index with 2 or 3 live neighbors continues living.
    elseif liveNeighbors >= 2
        nextState = 1;
    % Any live index with less than 2 live neighbors dies.
    else
        nextState = 0;
    end
end

end