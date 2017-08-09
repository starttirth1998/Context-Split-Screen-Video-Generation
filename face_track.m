clear;
oldFolder = cd('~/CVIT/Video_Stabilization/tracks/dos6');

fileID = fopen('dos6-willy.txt','r');
sizeA = [4 Inf];

A = fscanf(fileID,'%f %f %f %f',sizeA);
track_willy = A';

fclose(fileID);

cd(oldFolder);

save('Track_willy.mat','track_willy');