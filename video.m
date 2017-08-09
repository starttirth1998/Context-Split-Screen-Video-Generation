
load('Cropped_linda.mat');

oldFolder = cd('~/CVIT/Video_Stabilization/cropped_linda');

len = length(cropped_linda);


for i=1:len
    fname = sprintf('%03d.png', i);
    disp(i);
    imwrite(cropped_linda{1,i},fname);
end

cd(oldFolder);