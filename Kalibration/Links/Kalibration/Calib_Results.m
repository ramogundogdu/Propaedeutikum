% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5713.601719309826000 ; 5712.738494687809200 ];

%-- Principal point:
cc = [ 2658.242461643289500 ; 1660.792972601078600 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.098857790463246 ; 0.021806126383155 ; -0.000404483172824 ; 0.003019928537577 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 7.804427824491838 ; 7.909716287040880 ];

%-- Principal point uncertainty:
cc_error = [ 15.757684477380414 ; 17.527699972104070 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014669022538158 ; 0.177435551292601 ; 0.000813222940898 ; 0.000855478863343 ; 0.000000000000000 ];

%-- Image size:
nx = 5184;
ny = 3456;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 23;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.147959e+00 ; 2.262851e+00 ; 1.998328e-02 ];
Tc_1  = [ -8.646752e+01 ; -3.403505e+02 ; 1.899579e+03 ];
omc_error_1 = [ 3.119908e-03 ; 3.105498e-03 ; 6.919858e-03 ];
Tc_error_1  = [ 5.262501e+00 ; 5.832244e+00 ; 3.105590e+00 ];

%-- Image #2:
omc_2 = [ 1.857326e+00 ; 1.937324e+00 ; -4.926057e-01 ];
Tc_2  = [ -8.231143e+01 ; -2.605180e+02 ; 2.039640e+03 ];
omc_error_2 = [ 2.234831e-03 ; 2.654933e-03 ; 4.070004e-03 ];
Tc_error_2  = [ 5.631660e+00 ; 6.253309e+00 ; 2.691853e+00 ];

%-- Image #3:
omc_3 = [ 1.700735e+00 ; 1.700756e+00 ; -7.455782e-01 ];
Tc_3  = [ -1.031241e+02 ; -2.029243e+02 ; 2.127344e+03 ];
omc_error_3 = [ 2.288057e-03 ; 2.769915e-03 ; 3.524434e-03 ];
Tc_error_3  = [ 5.872154e+00 ; 6.521609e+00 ; 2.705298e+00 ];

%-- Image #4:
omc_4 = [ 1.596514e+00 ; 1.563760e+00 ; -8.691277e-01 ];
Tc_4  = [ -1.013990e+02 ; -2.015196e+02 ; 2.106368e+03 ];
omc_error_4 = [ 2.396043e-03 ; 2.845374e-03 ; 3.241030e-03 ];
Tc_error_4  = [ 5.819609e+00 ; 6.459698e+00 ; 2.634994e+00 ];

%-- Image #5:
omc_5 = [ -2.024781e+00 ; -2.064303e+00 ; -4.878450e-01 ];
Tc_5  = [ -1.040544e+02 ; -2.264305e+02 ; 1.643736e+03 ];
omc_error_5 = [ 1.883101e-03 ; 2.745919e-03 ; 4.617038e-03 ];
Tc_error_5  = [ 4.546680e+00 ; 5.052241e+00 ; 2.609476e+00 ];

%-- Image #6:
omc_6 = [ -1.854520e+00 ; -1.909772e+00 ; -6.929426e-01 ];
Tc_6  = [ -8.577194e+01 ; -1.303827e+02 ; 1.494033e+03 ];
omc_error_6 = [ 1.836300e-03 ; 2.878337e-03 ; 4.108610e-03 ];
Tc_error_6  = [ 4.118926e+00 ; 4.580078e+00 ; 2.365682e+00 ];

%-- Image #7:
omc_7 = [ -1.729402e+00 ; -1.795418e+00 ; -7.770402e-01 ];
Tc_7  = [ -8.553784e+01 ; -9.565229e+01 ; 1.365507e+03 ];
omc_error_7 = [ 1.916606e-03 ; 2.914481e-03 ; 3.802826e-03 ];
Tc_error_7  = [ 3.762214e+00 ; 4.183499e+00 ; 2.175964e+00 ];

%-- Image #8:
omc_8 = [ -1.649210e+00 ; -1.705687e+00 ; -8.380574e-01 ];
Tc_8  = [ -8.433952e+01 ; -7.621005e+01 ; 1.245245e+03 ];
omc_error_8 = [ 1.985719e-03 ; 2.941682e-03 ; 3.597498e-03 ];
Tc_error_8  = [ 3.430629e+00 ; 3.812781e+00 ; 2.004592e+00 ];

%-- Image #9:
omc_9 = [ 1.851829e+00 ; 1.646125e+00 ; 9.106391e-01 ];
Tc_9  = [ -1.205996e+02 ; -2.401159e+02 ; 1.668581e+03 ];
omc_error_9 = [ 2.930548e-03 ; 1.768049e-03 ; 3.744237e-03 ];
Tc_error_9  = [ 4.631141e+00 ; 5.126255e+00 ; 2.708960e+00 ];

%-- Image #10:
omc_10 = [ 1.788019e+00 ; 1.495613e+00 ; 1.031271e+00 ];
Tc_10  = [ -9.832408e+01 ; -2.289242e+02 ; 1.621648e+03 ];
omc_error_10 = [ 3.029204e-03 ; 1.886316e-03 ; 3.514316e-03 ];
Tc_error_10  = [ 4.499427e+00 ; 4.980251e+00 ; 2.664395e+00 ];

%-- Image #11:
omc_11 = [ 1.680584e+00 ; 1.372677e+00 ; 1.172840e+00 ];
Tc_11  = [ -7.904481e+01 ; -2.269827e+02 ; 1.586058e+03 ];
omc_error_11 = [ 3.108193e-03 ; 2.067236e-03 ; 3.280924e-03 ];
Tc_error_11  = [ 4.400913e+00 ; 4.871985e+00 ; 2.642484e+00 ];

%-- Image #12:
omc_12 = [ 1.611825e+00 ; 1.303749e+00 ; 1.235933e+00 ];
Tc_12  = [ -1.278676e+02 ; -2.146534e+02 ; 1.615452e+03 ];
omc_error_12 = [ 3.132292e-03 ; 2.143754e-03 ; 3.155838e-03 ];
Tc_error_12  = [ 4.489533e+00 ; 4.970532e+00 ; 2.695830e+00 ];

%-- Image #13:
omc_13 = [ -1.863171e+00 ; -1.884542e+00 ; 4.752847e-01 ];
Tc_13  = [ -4.178843e+01 ; -2.361422e+02 ; 2.007086e+03 ];
omc_error_13 = [ 2.601118e-03 ; 2.124644e-03 ; 4.214558e-03 ];
Tc_error_13  = [ 5.538011e+00 ; 6.148838e+00 ; 2.693857e+00 ];

%-- Image #14:
omc_14 = [ -1.695528e+00 ; -1.761503e+00 ; 6.961750e-01 ];
Tc_14  = [ 6.788363e+00 ; -2.387312e+02 ; 2.035294e+03 ];
omc_error_14 = [ 2.686634e-03 ; 2.075295e-03 ; 3.773417e-03 ];
Tc_error_14  = [ 5.613731e+00 ; 6.237301e+00 ; 2.666906e+00 ];

%-- Image #15:
omc_15 = [ -1.546092e+00 ; -1.613897e+00 ; 8.504360e-01 ];
Tc_15  = [ 3.679284e+01 ; -2.419176e+02 ; 2.096649e+03 ];
omc_error_15 = [ 2.796076e-03 ; 2.150177e-03 ; 3.450291e-03 ];
Tc_error_15  = [ 5.782580e+00 ; 6.429199e+00 ; 2.726325e+00 ];

%-- Image #16:
omc_16 = [ -1.384230e+00 ; -1.590470e+00 ; 8.819168e-01 ];
Tc_16  = [ 6.861902e+01 ; -2.538685e+02 ; 2.094855e+03 ];
omc_error_16 = [ 2.776297e-03 ; 2.282553e-03 ; 3.269305e-03 ];
Tc_error_16  = [ 5.774044e+00 ; 6.427667e+00 ; 2.764834e+00 ];

%-- Image #17:
omc_17 = [ -2.712771e+00 ; -1.509705e+00 ; -2.116913e-01 ];
Tc_17  = [ -2.163847e+02 ; -1.699728e+02 ; 1.763940e+03 ];
omc_error_17 = [ 3.161648e-03 ; 2.183075e-03 ; 5.577078e-03 ];
Tc_error_17  = [ 4.899145e+00 ; 5.410885e+00 ; 2.860018e+00 ];

%-- Image #18:
omc_18 = [ -2.894558e+00 ; -9.547811e-01 ; -2.298514e-02 ];
Tc_18  = [ -2.693041e+02 ; -4.284417e+01 ; 1.815247e+03 ];
omc_error_18 = [ 4.145924e-03 ; 1.538535e-03 ; 6.013802e-03 ];
Tc_error_18  = [ 5.016152e+00 ; 5.571045e+00 ; 2.862386e+00 ];

%-- Image #19:
omc_19 = [ 9.205762e-01 ; 2.781087e+00 ; 2.060789e-01 ];
Tc_19  = [ 2.967070e+02 ; -4.312532e+02 ; 1.880951e+03 ];
omc_error_19 = [ 1.455291e-03 ; 3.025601e-03 ; 5.188647e-03 ];
Tc_error_19  = [ 5.217630e+00 ; 5.818214e+00 ; 3.129600e+00 ];

%-- Image #20:
omc_20 = [ 6.064395e-01 ; 2.810540e+00 ; 1.606929e-01 ];
Tc_20  = [ 3.814620e+02 ; -4.059946e+02 ; 1.935482e+03 ];
omc_error_20 = [ 1.223414e-03 ; 3.071545e-03 ; 5.050288e-03 ];
Tc_error_20  = [ 5.364593e+00 ; 6.003166e+00 ; 3.187052e+00 ];

%-- Image #21:
omc_21 = [ 1.235847e+00 ; 1.626725e+00 ; -3.206324e-01 ];
Tc_21  = [ -8.131288e+01 ; -2.500690e+02 ; 1.979300e+03 ];
omc_error_21 = [ 2.442082e-03 ; 2.602380e-03 ; 3.001825e-03 ];
Tc_error_21  = [ 5.462993e+00 ; 6.069799e+00 ; 2.579008e+00 ];

%-- Image #22:
omc_22 = [ 1.283231e+00 ; 1.561664e+00 ; -5.128786e-01 ];
Tc_22  = [ -9.150704e+01 ; -2.625127e+02 ; 1.985297e+03 ];
omc_error_22 = [ 2.464146e-03 ; 2.699211e-03 ; 2.935789e-03 ];
Tc_error_22  = [ 5.488676e+00 ; 6.092038e+00 ; 2.543550e+00 ];

%-- Image #23:
omc_23 = [ 2.163902e+00 ; 2.221610e+00 ; 8.258067e-02 ];
Tc_23  = [ -8.910877e+01 ; -1.545888e+02 ; 1.990916e+03 ];
omc_error_23 = [ 3.347001e-03 ; 2.882106e-03 ; 6.674392e-03 ];
Tc_error_23  = [ 5.493172e+00 ; 6.109467e+00 ; 3.171027e+00 ];

