clc
clear all
close all
delete fulls/*
delete thumbs/*

photofilelist = dir('./Photos/*.jpeg');
len = size(photofilelist,1 );

startindex = 28;

for i = 1:len
    copyfile(['./Photos/' photofilelist(i).name], ['./fulls/' mat2str(startindex + i - 1) '.jpeg'])
    
    I = imread(['./Photos/' photofilelist(i).name]);
    J = imresize(I, 0.5);
    imwrite(J, ['./thumbs/' mat2str(startindex + i - 1) '.jpeg']);
%     copyfile(['./Photos/' photofilelist(i).name], ['./thumbs/' mat2str(startindex + i - 1) '.jpeg'])
end

thumbfilelist = dir('./thumbs/*.jpeg');
len = size(photofilelist,1 );

sizevector = zeros(len, 1);

for i = 1:len
    sizevector(i, 1) = thumbfilelist(i).bytes;
end
fprintf('The maximal size of the thumbs are %f MB', max(sizevector)/1024/1024);
    