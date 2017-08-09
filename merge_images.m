
clear;
load('New_cropped_willy1.mat');
load('New_cropped_willy2.mat');
load('New_cropped_willy3.mat');
load('New_cropped_willy4.mat');

cnt = 1;
for i=1:300
    new_cropped_willy{cnt} = new_cropped_willy1{1,i};
    cnt = cnt + 1;
end

for i=301:600
    new_cropped_willy{cnt} = new_cropped_willy2{1,i-300};
    cnt = cnt + 1;
end

for i=601:900
    new_cropped_willy{cnt} = new_cropped_willy3{1,i-600};
    cnt = cnt + 1;
end

for i=901:1093
    new_cropped_willy{cnt} = new_cropped_willy4{1,i-900};
    cnt = cnt + 1;
end

save('New_cropped_willy.mat','new_cropped_willy');