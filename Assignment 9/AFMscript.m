clear
clc
close all

load ('AFMdata0001.mat') % Loading current, friction and height data

ss = 200; % Specifying scan size as 200
saveName = 'AFMplot1'; % Specifying saveName

% Call plotAFMdata function
plotAFMdata(height,friction,current,ss,saveName)
