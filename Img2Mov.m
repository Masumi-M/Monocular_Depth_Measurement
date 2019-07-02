%% Info
% @created 2019/6/13 [Masumi Morishige / Yoshikazu Takahashi]

%% Reset
clear;
close all;
clc;
save_dir_name = '../Database/Result/LapLacianFilter_MovData/';
input_dir_name = '../Database/Result/LapLacianFilter_MovData/';

%% Main
tic;
fprintf('--- Start of the Script [%f] --- \n', toc);

v = VideoWriter(strcat(save_dir_name,'laplacian_filter.avi'),'Uncompressed AVI');
v.FrameRate = 60;
open(v);

for i = 1:990
    A = imread(strcat(input_dir_name, 'laplacian_filter', int2str(i), '.jpg'));
    writeVideo(v,A);
end

close(v);

%% End of the Script
fprintf('--- End of the Script [%f] --- \n', toc);