%% Info
% @created 2019/6/11 [Masumi Morishige]

%% Reset
clear;
close all;
clc;
save_dir_name = './Database/Result/LapLacianFilter_MovData/';

%% Main
% SetParameter
subjectName = '../Database/RawData/Cup1.MOV';
movObj = VideoReader(subjectName);

tic;
i_count = 1;
fprintf('--- Start of the Script [%f] --- \n', toc);

laplacianArray = [1 1 1 ; 1 -8 1; 1 1 1];
figure;

while hasFrame(movObj)
    subjectIMG = readFrame(movObj);
    
    % GrayScale
    appleIMG_gray = rgb2gray(subjectIMG);
    imshow(appleIMG_gray);
    saveas(gcf, strcat(save_dir_name, strcat('grayscale', int2str(i_count),'.jpg')));
    
    % Laplacian Operator
    appleIMG_laplacian = uint8(filter2(laplacianArray, appleIMG_gray));
    imshow(appleIMG_laplacian);
    saveas(gcf, strcat(save_dir_name, strcat('laplacian_filter', int2str(i_count),'.jpg')));
    i_count = i_count + 1;
    fprintf('i: %d \n', i_count);
end

%% End of the Script
fprintf('--- End of the Script [%f] --- \n', toc);

