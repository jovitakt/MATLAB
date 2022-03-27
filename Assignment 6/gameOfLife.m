function finalState = gameOfLife(initialState,N)
% Run the Game of Life on a two dimensional matrix of arbitrary
% size, initialState, for N iterations. Matrix initialState
% should contain values of only 0 (a dead state) or 1 (a live
% state). See the following for a description of the Game of
% Life: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life


% Graph the initialState matrix.
h = imagesc(initialState); % plot the matrix
axis off equal % remove axes and scale equally
axis xy % override the flipped y axis due to imagesc use
colormap(flipud(gray)) % use an inverted gray colormap (black = 1, white = 0)
caxis([0 1]) % specify color map scale to avoid a "gray out"

% Add a title that communicates the number of iterations.
t = title('Initial state');

pause(.5) % pause to update the figure/give time to view the visualization


% Size of the incoming matrix.
[s1,s2] = size(initialState);


% Evolve the Game of Life for N generations.
for genCounter = 1:N
    
    % For each index element of the initialState, check how many
    % neighbors are alive and the current state of the index to
    % determine if the index should be alive or dead in the next
    % state, finalState.
    for jj = 1:s1
        for kk = 1:s2
            
            % Check how many neighbors of index (jj,kk) of
            % initialState are alive. ***you must create the
            % function checkNeighbors***
            numberAlive = checkNeighbors(initialState,jj,kk);
            
            
            % Compare the current state of index (jj,kk) and the
            % number of neighbors of index (jj,kk) that are alive
            % to determine if index (jj,kk) is alive or dead in
            % the next state, in accordance with the Game of Life
            % rule set. ***you must create the function
            % indexState***
            finalState(jj,kk) = ...
                indexState(initialState(jj,kk),numberAlive);
            
        end
    end
    
    % Update the definition of initialState now that all
    % finalState indices have been computed. finalState becomes
    % the initialState in the next iteration of the loop.
    initialState = finalState;
    
    % Update the visualization, update the title, and pause for a
    % .15
    % seconds. This method overwrites the color data of
    % the existing visualizaton, which is identified by
    % handle h.
    h.CData = finalState;
    t.String = ['Generation ', num2str(genCounter), ...
        ' of ', num2str(N)];
    pause(.15)
    
end