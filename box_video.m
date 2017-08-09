clear;
load('Frames3.mat');
load('New_track_linda.mat');
load('New_track_willy.mat');
load('Track_linda.mat');
load('Track_willy.mat');

%nfiles = length(images_frames4);
oldFolder = cd('~/CVIT/Video_Stabilization/box_frames_2/');

cnt = 1;

for j=601:900
    filename = sprintf('%04d.png',j);
    i = cnt;
    disp(i);
    x1w = new_track_willy(j,1);
    y1w = new_track_willy(j,2);
    x2w = new_track_willy(j,3);
    y2w = new_track_willy(j,4);

    center_xw = (x1w+x2w)/2;
    center_yw = (y1w+y2w)/2;
    hgtw = (y2w-y1w)/2;
    wdtw = (x2w-x1w)/2;
    
    ori_x1w = track_willy(j,1);
    ori_y1w = track_willy(j,2);
    ori_x2w = track_willy(j,3);
    ori_y2w = track_willy(j,4);

    ori_center_xw = (ori_x1w + ori_x2w)/2;
    ori_center_yw = (ori_y1w + ori_y2w)/2;
    ori_hgtw = (ori_y2w - ori_y1w)/2;
    ori_wdtw = (ori_x2w - ori_x1w)/2;
    
    x1l = new_track_linda(j,1);
    y1l = new_track_linda(j,2);
    x2l = new_track_linda(j,3);
    y2l = new_track_linda(j,4);

    center_xl = (x1l+x2l)/2;
    center_yl = (y1l+y2l)/2;
    hgtl = (y2l-y1l)/2;
    wdtl = (x2l-x1l)/2;

    ori_x1l = track_linda(j,1);
    ori_y1l = track_linda(j,2);
    ori_x2l = track_linda(j,3);
    ori_y2l = track_linda(j,4);

    ori_center_xl = (ori_x1l + ori_x2l)/2;
    ori_center_yl = (ori_y1l + ori_y2l)/2;
    ori_hgtl = (ori_y2l - ori_y1l)/2;
    ori_wdtl = (ori_x2l - ori_x1l)/2;
    
    pos_willy = [x1w-3*wdtw y1w-0.5*hgtw 8*wdtw 5*hgtw];
    ori_pos_willy = [ori_x1w-3*ori_wdtw ori_y1w-0.5*ori_hgtw 8*ori_wdtw 5*ori_hgtw];
    pos_linda = [x1l-3*wdtl y1l-0.5*hgtl 8*wdtl 5*hgtl];
    ori_pos_linda = [ori_x1l-3*ori_wdtl ori_y1l-0.5*ori_hgtl 8*ori_wdtl 5*ori_hgtl];
    
    images_frames3{1,i} = insertShape(images_frames3{1,i},'Rectangle',...
        pos_willy,'Color','green','LineWidth',5);
    
    images_frames3{1,i} = insertShape(images_frames3{1,i},'Rectangle',...
        pos_linda,'Color','yellow','LineWidth',5);
    
    images_frames3{1,i} = insertShape(images_frames3{1,i},'Rectangle',...
        ori_pos_willy,'Color','blue','LineWidth',5);
    
    images_frames3{1,i} = insertShape(images_frames3{1,i},'Rectangle',...
        ori_pos_linda,'Color','blue','LineWidth',5);
    
    cnt = cnt + 1;
    imwrite(images_frames3{1,i},filename);
end

cd(oldFolder);
