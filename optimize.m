run('~/CVIT/cvx/cvx_setup.m');
clear;
load('Track_willy.mat');

x1(:) = track_willy(:,1);
y1(:) = track_willy(:,2);
x2(:) = track_willy(:,3);
y2(:) = track_willy(:,4);

center_x(:) = (x1(:)+x2(:))/2;
center_y(:) = (y1(:)+y2(:))/2;
hgt(:) = (y2(:)-y1(:))/2;
wdt(:) = (x2(:)-x1(:))/2;

N = size(track_willy,1);

e = ones(N,1);
D1 = spdiags([-e e], 0:1, N-1, N);
D2 = spdiags([e -2*e e], 0:2, N-2, N);
D3 = spdiags([-e 3*e -3*e e], 0:3, N-3, N);
lambda1 = 1000;lambda2 = 10;lambda3 = 10;

cvx_begin
variable new_x(1*N)
variable new_y(1*N)
variable new_w(1*N)
variable new_h(1*N)


minimize(0.5*sum_square(center_x(:)-new_x) +  ...
    + lambda1*norm(D1*new_x,1) + lambda2*norm(D2*new_x,1) + ...
    lambda3*norm(D3*new_x,1) + ...
    0.5*sum_square(center_y(:)-new_y) +  ...
    + lambda1*norm(D1*new_y,1) + lambda2*norm(D2*new_y,1) + ...
    lambda3*norm(D3*new_y,1) + ...
    0.5*sum_square(wdt(:)-new_w) +  ...
    + lambda1*norm(D1*new_w,1) + lambda2*norm(D2*new_w,1) + ...
    lambda3*norm(D3*new_w,1) + ...
    0.5*sum_square(hgt(:)-new_h) +  ...
    + lambda1*norm(D1*new_h,1) + lambda2*norm(D2*new_h,1) + ...
    lambda3*norm(D3*new_h,1)...
)

cvx_end

new_x1(:) = new_x(:)-wdt(:);
new_y1(:) = new_y(:)-hgt(:);
new_x2(:) = new_x(:)+wdt(:);
new_y2(:) = new_y(:)+hgt(:);

new_track_willy = [new_x1;new_y1;new_x2;new_y2]';

save('New_track_willy.mat','new_track_willy');
%save('New_track_linda.txt','new_x','new_y','new_w','-ascii');