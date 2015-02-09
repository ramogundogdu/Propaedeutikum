
% ============================
% Load data
% ============================

% matching test pics
% imageLeft = imread('left-2.gif','gif');
% imageRight = imread('right15-2.gif','gif');
%imageLeft = imread('left-rgb.png','png');
%imageRight = imread('right15-rgb.png','png');

% stereo fotos
%imageLeft = imread('IMG_2039.jpg','jpg');
%imageRight = imread('IMG_9832.JPG','jpg');

% rectified SCALED DOWN fotos
RectifiedImageLeftSMALL = imread('RectifiedImageLeft250w.jpg','jpg');
RectifiedImageRightSMALL = imread('RectifiedImageRight250w.jpg','jpg');

% rectification test frame
load(['testData/matching_test_frame']);
% rectified test data
load(['testData/rectify_test_results']);

% calibration data
%load(['cam_data']);

% ============================
% Rectification
% ============================

%[RectifiedImageLeft, RectifiedImageRight, PLrect, PRrect] = rectifyImages(imageLeft, imageRight, KK_left, KK_right, R, T);

% ============================
% Correlation matching
% ============================

DispMap = correlationMatching(RectifiedImageLeftSMALL, RectifiedImageRightSMALL, 7);
%DispMap = correlationMatchingFrame(RectifiedImageLeft, RectifiedImageRight, 5, FrameO, FrameDim);

