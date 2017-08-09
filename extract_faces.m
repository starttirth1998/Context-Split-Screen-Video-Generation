clear;
load('Frames4.mat');
load('New_track_willy.mat');

%nfiles = length(images_frames4);

cnt = 1;

for j=901:1093
    i = cnt;
    disp(i);
    x1 = new_track_willy(j,1);
    y1 = new_track_willy(j,2);
    x2 = new_track_willy(j,3);
    y2 = new_track_willy(j,4);

    center_x = (x1+x2)/2;
    center_y = (y1+y2)/2;
    hgt = (y2-y1)/2;
    wdt = (x2-x1)/2;
    
    new_cropped_willy4{i} = imcrop(images_frames4{1,i},[x1-3*wdt y1-0.5*hgt 8*wdt 5*hgt]);
    cnt = cnt + 1;
    %images_frames4{1,i} = insertShape(images_frames4{1,i},'Rectangle',...
    %   [x1-3*wdt y1-0.5*hgt 8*wdt 5*hgt],'Color','green','LineWidth',5);
    %imshow(images_frames1{1,j});
    %hold on;
    %rectangle('Position',[x1-3*wdt y1-0.5*hgt 8*wdt 5*hgt],'EdgeColor','g');
    %hold off;
end

save('New_cropped_willy4.mat','new_cropped_willy4');