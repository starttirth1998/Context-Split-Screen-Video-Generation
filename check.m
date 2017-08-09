clear;
load('New_cropped_willy.mat');

oldFolder = cd('~/CVIT/Video_Stabilization/new_cropped_willy/');

len = length(new_cropped_willy);

for i=1:len
    filename = sprintf('%04d.png',i);
    disp(filename);
    %new_cropped_linda{1,i} = imresize(new_cropped_linda{1,i},[1080 1920]);
    %imshow(new_cropped_willy{1,i});
    imwrite(new_cropped_willy{1,i},filename);
end

cd(oldFolder);