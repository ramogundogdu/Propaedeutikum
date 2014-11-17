% camera parameters
KLeft = [   5.713601719309826e+03 0 2.658242461643290e+03;
            0 5.712738494687809e+03 1.660792972601079e+03;
            0 0 1]; 
    
KRight = [  5.981077612974650e+03 0 2.650395776336830e+03;
            0 5.978531933147809e+03 1.683503291451972e+03;
            0 0 1];
        
load('Sport_cam.mat');
        
% rotation matrix       
R = [0.999644483280861 0.004272576828712 0.026318285152777;
    -0.005217032123749 0.999340964211527 0.035922413958365;
    -0.026147459187461 -0.036046946278695 0.999007971961196];

% rotation vector wrt Left camera
om = [-0.035996719310040;
    0.026241648754233;
    -0.004746391918708];

% translation vector wrt Left camera
T = [-2.895069355204481e+02;
    8.790596837143005;
    -15.559014982461760];

Po1 = KLeft * [1 0 0 0; 0 1 0 0; 0 0 1 0];
Po2 = KRight * [R T];
disp([R T]);

% rectification matrizes
[T1,T2,Pn1,Pn2] = rectify(pml, pmr);
[A R t] = art(pml)
[An Rn tn] = art(Pn1)


%reading images
% ImageLeft = imread('IMG_8288_left.JPG');
% ImageRight = imread('IMG_8822_right.JPG');
ImageLeft = imread('Sport0.png');
ImageLeftG = rgb2gray(ImageLeft);

ImageRight = imread('Sport1.png');
ImageRightG = rgb2gray(ImageRight);

% create transformation objects
tFormLeft = projective2d(T1);
tFormRight = projective2d(T2);

% for i=1:1%ImageLeft(:,end)
%     for j=1:1%ImageLeft(end,:)
%         currentPixel = ImageLeft(i,j);
%         disp(currentPixel);
%     end
% end

% transform images
ImageLeftRect = imwarp2(ImageLeftG, T1, 'linear', 'valid');
%ImageRightRect = imwarp2(ImageRight, T1);

%imshow(ImageLeftRect);

