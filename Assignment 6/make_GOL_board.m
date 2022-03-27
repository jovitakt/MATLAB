function make_GOL_board()
% MAKE_GOL_BOARD. A user interface to create or modify a Game of
% Life (GOL) board. Right and left click and drag to add or
% delete, respectively alive cells on the plot. Enables the user
% to save the GOL board to a custom filename and includes file
% overwrite protection.

clc, close all

% Initialize the board with all indices dead.
n_rows = 25; % starting number of rows
n_cols = 15; % starting number of columns
board = zeros(n_rows,n_cols);

% Create figure window and mouse callbacks. Fill screen (almost)
% with figure window in the center of the screen.
figure('WindowButtonDownFcn',@click,...
    'WindowButtonUpFcn',@release,...
    'WindowButtonMotionFcn',@move,...
    'Units','normalized','position',[.05 .1 .9 .8]);

% Plot the inital board and grid on a new pair of axes.
[im,a] = regeneratePlot(board,n_rows,n_cols,NaN);


% Static text above the matrix plot.
tString = {'Right click or right click and drag',...
    'to add live cells. Left click or',...
    'left click and drag to delete live cells.'};

uicontrol('Style','text','Units','normalized',...
    'Position',[.1 .85, .5, .1],'String',tString,'FontSize',12)

% Edit text box to change the number of rows.
ui_row = uicontrol('Style','edit','Units','normalized',...
    'Position',[.64 .7, .1, .1],'FontSize',16,...
    'Callback',@adjustRow);

ui_row.String = num2str(n_rows);

% Static text above the row edit text box.
uicontrol('Style','text','Units','normalized',...
    'Position',[.64, .8, .1, .05],'String','Rows','FontSize',16)

% Edit text box to change the number of columns.
ui_col = uicontrol('Style','edit','Units','normalized',...
    'Position',[.79, .7, .1, .1],'FontSize',16,...
    'Callback',@adjustCol);

ui_col.String = num2str(n_cols);

% Static text above the col edit text box.
uicontrol('Style','text','Units','normalized',...
    'Position',[.79 .8, .1, .05],'String','Columns','FontSize',16)

% Static text above the row and column edit boxes.
tString = {'Adjust rows and columns via ',...
    'the edit text boxes'};
uicontrol('Style','text','Units','normalized',...
    'Position',[.61, .86, .3, .05],'String',tString,'FontSize',12)

% Edit text box used to enter filename of output.
ui_filename = uicontrol('Style','edit','Units','normalized',...
    'Position',[.63, .47, .28, .1],'FontSize',16,...
    'String','test_board_1');

% Static text above the filename edit text box.
tString = {'Change the filename if desired and before saving'};
uicontrol('Style','text','Units','normalized',...
    'Position',[.62, .57, .3, .05],'String',...
    tString,'FontSize',12)

% Pushbutton to save the board to a .mat file in the working
% folder.
uicontrol('Style','Pushbutton','Units','normalized',...
    'Position',[.63, .24, .28, .2],'FontSize',16,...
    'String','Save file!','Callback',@saveFile);

% Pushbutton to open an existing file.
uicontrol('Style','Pushbutton','Units','normalized',...
    'Position',[.63, .1, .28, .1],'FontSize',16,...
    'String','Open existing file','Callback',@openFile);

% Variable used to track if a mouse button was pressed. Takes on
% the value of 1 if the left mouse button was pressed, 0 if the
% right mouse button was pressed, and NaN otherwise. When val=NaN
% it blocks the mouse button motion function.
val = NaN;


    function click(h,~)
        % CLICK. Executes when a mouse button is pressed.
        % Determines the button that was pressed and updates
        % control variable val accordingly.
        
        % Determine which mouse button was pressed.
        switch h.SelectionType
            case 'normal' % left click
                val = 1;
                
            case 'alt' % right click
                val = 0;
        end
        
        % Call the move function, which will get the position of
        % the mouse and update the GOL plot.
        move
    end



    function release(varargin)
        % RELEASE. Resets val to NaN (its mouse motion blocking
        % state) upon release of a mouse button.
        
        val = NaN;
    end



    function move(varargin)
        % MOVE. Executes when mouse button motion is detected.
        % Adds or deletes alive cells from the game of life board
        % depending on the value of val, which is inherited from
        % the mouse button down callback.
        
        % Get the cursor position. Round to nearest integer so
        % the position can be used to address the indices of
        % board.
        pos = get (gca, 'CurrentPoint');
        col = round(pos(1,1)); row = round(pos(1,2));
        
        % Update the GOL board if the pointer is within the axes
        % bounds and a mouse button has been pressed but not yet
        % released.
        if row >= 1 && row <= n_rows && col >= 1 && ...
                col <= n_cols && ~isnan(val)
            board(row,col) = val;
            updatePlot
        end
    end



    function adjustRow(h,~)
        % ADJUSTROW. Update the number of rows on the board if
        % the user changes the number of rows in the number of
        % rows edit text box.
        
        % Get number of rows from edit text box. Round in case
        % the user enter a non-integer.
        new_row = round(str2double(h.String));
        
        % Set number of rows to 3 if user input a number less
        % than 2.
        if new_row <= 2
            new_row = 3;
        end
        
        % Update the board based on the new number of rows.
        if new_row > n_rows
            board(new_row,n_cols) = 0;
        else
            board = board(1:new_row,:);
        end
        
        % Update the number of rows in both the variable and
        % visual interface.
        n_rows = new_row;
        h.String = num2str(n_rows);
        
        % Regenerate the plot.
        [im,a] = regeneratePlot(board,n_rows,n_cols,a);
    end



    function adjustCol(h,~)
        % ADJUSTCOL. Update the number of columns on the board if
        % the user changes the number of columns in the number of
        % columns edit text box.
        
        % Get number of columns from edit text box. Round in case
        % the user enter a non-integer.
        new_col = round(str2double(h.String));
        
        % Set number of columns to 3 if user input a number less
        % than 2.
        if new_col <= 2
            new_col = 3;
        end
        
        % Update the board based on the new number of columns.
        if new_col > n_cols
            board(n_rows,new_col) = 0;
        else
            board = board(:,1:new_col);
        end
        
        % Update the number of columns in both the variable and
        % visual interface.
        n_cols = new_col;
        h.String = num2str(n_cols);
        
        % Regenerate the plot.
        [im,a] = regeneratePlot(board,n_rows,n_cols,a);
    end



    function saveFile(varargin)
        % SAVEFILE. Executes when the save file pushbotton is
        % pressed.
        
        % Get the filename from the edit text box.
        filename = ui_filename.String;
        filename = [filename,'.mat'];
        
        % Generate list of files in the working directory.
        allFiles = dir;
        
        % Initialize blocking variables.
        overwrite = 'Yes';
        fileExists = false;
        
        % Identify if the proposed filename already exists in the
        % working folder.
        for jj = 1:length(allFiles)
            if strcmp(allFiles(jj).name,filename)
                fileExists = true;
            end
        end
        
        % If the filename exists, ask the user if they want to
        % overwrite the file.
        if fileExists
            overwrite = questdlg(...
                'Do you wish to overwrite an existing file?',...
                'File exists!','Yes','No','No');
        end
        
        % Save the file to the working folder if it doesn't exist
        % in the working folder or the user confirmed overwrite.
        if strcmp(overwrite,'Yes')
            save(filename,'board')
            disp(['File saved to working folder as ',...
                filename])
        end
    end



    function openFile(varargin)
        % OPENFILE. Executes when the open file pushbotton is
        % pressed.
        
        % Open a file opener dialogue.
        [filename, path] = uigetfile('*.mat');
        
        % Load the file and update the number of rows, columns,
        % and the filename. Utilizes try/catch in case the user
        % x's out of the dialogue, fails to select a file, or
        % selects the wrong type of file.
        try
            load([path,'\',filename],'board')
            n_rows = size(board,1);
            n_cols = size(board,2);
            ui_row.String = num2str(n_rows);
            ui_col.String = num2str(n_cols);
            ui_filename.String = filename(1:end-4);
            [im,a] = regeneratePlot(board,n_rows,n_cols,a);
        catch
            disp('Something went wrong during the load!')
        end
    end



    function updatePlot
        % UPDATEPLOT. Updates the color data of the Game of Life
        % board being designed.
        
        im.CData = board;
    end

end



function [im,a] = regeneratePlot(board,n_rows,n_cols,a)
% REGENERATEPLOT. Recreates a visual representation of the GOL
% board and adds a grid. Grid addition required a bit of
% hackiness due to the limitations of imagesc().

% Outputs the handle to the plot as im and the handle to the axes
% as a. Input board is the GOL matrix. Inputs n_rows and n_cols
% represent the number of rows and columns of the board. a is the
% handle to the axes.

% Delete the old axes. Otherwise, a ghost of the old axes will be
% left behind if the axes change shape due to a row or column
% size change.
if ishandle(a)
    delete(a)
end

% Plot the inital board on a new pair of axes.
a = axes('Position',[.1 .1 .5 .7]);
im = imagesc(board);
colormap(flipud(gray))
caxis([0 1])

% Create a grid, color gray. Offset gridlines by .5; required as
% plotting was achieved with imagesc, which visually shifts the
% index centers by .5.
hold on
for jj = 1:n_rows
    line([1-.5, n_cols+.5], [jj-.5, jj-.5], 'Color', [.5 .5 .5])
end

for jj = 1:n_cols
    line([jj-.5, jj-.5], [1-.5, n_rows+.5], 'Color', [.5 .5 .5])
end
hold off

% Change from a flipped y origin (a result of imagesc, places y
% origin at top of plot) to standard orientation (y origin at
% bottom), scale the x and y axes equivalently so that cells have
% a square appearance no matter the number of rows and columns,
% and squeeze the axes bounds to the extents of the data.
axis xy equal tight
end