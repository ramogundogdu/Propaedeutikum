% imageLeft = imread('left-2.gif','gif');
% imageRight = imread('right15-2.gif','gif');

imageLeft = imread('IMG_2039.jpg','jpg');
imageRight = imread('IMG_9832.JPG','jpg');

load(['cam_data']);

%DispMap = correlationMatching(imageLeft, imageRight);

[RectifiedImageLeft, RectifiedImageRight, PLrect, PRrect] = rectifyImages(imageLeft, imageRight, KK_left, KK_right, R, T);

