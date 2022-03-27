% gameOfLife_start.m
% Load a Game of Life matrix ('board') and run the Game of Life.

clear, clc, close all % clean up workspace and close all figures

% Load command assumes the .mat file is located in the working
% folder or the search path. ***Feel free to adjust the filename
% in correspondance with other boards available in the associated
% code file for the assignment or any boards that you have
% created - e.g. test_board_2.mat***
load('test_board_1.mat','board')

% Number of generations of the Game of life. ***Feel free to
% adjust the number of iterations.***
gens = 500;

% Call the game of life with initial matrix MatrixIn, evolve the
% game for gens iterations, and return the final state of the
% game, outState.
outState = gameOfLife(board,gens);