function liveNeighbors = checkNeighbors (initialState,m,n)
% Takes in the initial state of the matrix, and the row m and column n of 
% the index under consideration. Reports back the number of live neighbors.

% Takes the size of initialState, separating into no of columns & no of rows
[nRows,nColumns] = size(initialState);

% Initialise the liveNeighbors as 0
liveNeighbors = 0;

% Checking the neighbours around the value under consideration

% To the left of the value under consideration. If it is live, number of
% liveNeighbors + 1
if m-1 >= 1
    if initialState(m-1,n) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% To the right of the value under consideration. If it is live, number of
% liveNeighbors + 1
if m+1 <= nRows
    if initialState(m+1,n) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% To the top of the value under consideration. If it is live, number of
% liveNeighbors + 1
if n + 1 <= nColumns
    if initialState(m,n+1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% To the bottom of the value under consideration. If it is live, number of
% liveNeighbors + 1
if n - 1 >= 1
    if initialState(m,n-1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% Upper right diagonal of the value under consideration. If it is live,
% number of liveNeighbors + 1
if m+1 <= nRows && n + 1 <= nColumns
    if initialState(m+1,n+1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% Upper left diagonal of the value under consideration. If it is live,
% number of liveNeighbors + 1
if m-1 >= 1 && n + 1 <= nColumns
    if initialState(m-1,n+1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% Lower right diagonal of the value under consideration. If it is live,
% number of liveNeighbors + 1
if m+1 <= nRows && n - 1 >= 1
    if initialState(m+1,n-1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

% Lower left diagonal of the value under consideration. If it is live,
% number of liveNeighbors + 1
if m-1 >= 1 && n - 1 >= 1
    if initialState(m-1,n-1) == 1
        liveNeighbors = liveNeighbors + 1;
    end
end

end
