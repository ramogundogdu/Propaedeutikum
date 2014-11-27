% camera parameters
KLeft = [   5.713601719309826e+03 0 2.658242461643290e+03;
            0 5.712738494687809e+03 1.660792972601079e+03;
            0 0 1]; 
    
KRight = [  5.981077612974650e+03 0 2.650395776336830e+03;
            0 5.978531933147809e+03 1.683503291451972e+03;
            0 0 1];
        
%load('Sport_cam.mat');
        
% rotation matrix       
R = [0.999644483280861 0.004272576828712 0.026318285152777;
    -0.005217032123749 0.999340964211527 0.035922413958365;
    -0.026147459187461 -0.036046946278695 0.999007971961196];

% translation vector wrt Left camera
T = [-2.895069355204481e+02;
    8.790596837143005;
    -15.559014982461760];

% Transformation matrizes
Po1 = KLeft * [1 0 0 0; 0 1 0 0; 0 0 1 0];
Po2 = KRight * [R T];

% Epipolar geometry
%FUND Computes fundamental matrix and epipoles from camera matrices.
%[F,epil,epir] = fund(Po1,Po2);

%Loading images
ImageL = imread(['IMG_8288_left.JPG'],'jpg');
ImageR = imread(['IMG_8822_right.JPG'],'jpg');

disp('---------------------------------- rectifying...')

%  rectification without centeriing
[TL,TR,pml1,pmr1] = rectify(Po1,Po2);

% centering LEFT image
p = [size(ImageL,1)/2; size(ImageL,2)/2; 1];
px = TL * p;
dL = p(1:2) - px(1:2)./px(3) ;

% centering RIGHT image
p2 = [size(ImageR,1)/2; size(ImageR,2)/2; 1];
px2 = TR * p2; 
dR = p2(1:2) - px2(1:2)./px2(3);

% vertical diplacement must be the same
dL(2) = dR(2);

dL
dR

%  rectification with centering
[TL,TR,pml1,pmr1] = rectify(Po1,Po2);
[TL2,TR2,pml12,pmr12] = rectify(Po1,Po2,dL,dR);


disp('---------------------------------- warping...')

% find the smallest bb containining both images
bb = mcbb(size(ImageL),size(ImageR), TL, TR);

% warp RGB channels,
for c = 1:3

    % Warp LEFT
    [JL(:,:,c),bbL,alphaL] = imwarp2(ImageL(:,:,c), TL, 'bilinear', bb);

    % Warp RIGHT
    [JR(:,:,c),bbR,alphaR] = imwarp2(ImageR(:,:,c), TR, 'bilinear', bb);

end

bb2 = mcbb(size(ImageL),size(ImageR), TL2, TR2);

% warp RGB channels,
for c = 1:3

    % Warp LEFT
    [JL2(:,:,c),bbL,alphaL] = imwarp2(ImageL(:,:,c), TL2, 'bilinear', bb2);

    % Warp RIGHT
    [JR2(:,:,c),bbR,alphaR] = imwarp2(ImageR(:,:,c), TR2, 'bilinear', bb2);

end

subplot(2,2,1);
image(JL);
axis image
title('Left image');
% hold on
% plot(p(1,:), p(2,:),'w+','MarkerSize',12);
% hold off

subplot(2,2,2);
image(JR);
axis image
title('Right image');
% hold on
% plot(p2(1,:), p2(2,:),'w+','MarkerSize',12);
% hold off


subplot(2,2,3);
image(JL2);
axis image
title('Left image Rect');

subplot(2,2,4);
image(JR2);
axis image
title('Right image Rect');

