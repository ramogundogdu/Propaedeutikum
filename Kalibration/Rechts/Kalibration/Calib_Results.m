% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5981.077612974650000 ; 5978.531933147808600 ];

%-- Principal point:
cc = [ 2650.395776336830300 ; 1683.503291451971800 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.049744274773245 ; -0.592399294384716 ; -0.001484167814440 ; 0.002425459244827 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 11.450198814555900 ; 11.545818126572009 ];

%-- Principal point uncertainty:
cc_error = [ 22.424146936703348 ; 24.147103853160971 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.021068558962058 ; 0.261320251488074 ; 0.001053097458429 ; 0.001316914035860 ; 0.000000000000000 ];

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
omc_1 = [ 2.154571e+00 ; 2.263152e+00 ; -1.831102e-02 ];
Tc_1  = [ -3.254395e+02 ; -3.236211e+02 ; 1.913037e+03 ];
omc_error_1 = [ 4.062691e-03 ; 4.649687e-03 ; 9.919499e-03 ];
Tc_error_1  = [ 7.201555e+00 ; 7.768801e+00 ; 4.272611e+00 ];

%-- Image #2:
omc_2 = [ 1.862664e+00 ; 1.948750e+00 ; -5.153753e-01 ];
Tc_2  = [ -3.219213e+02 ; -2.432228e+02 ; 2.039698e+03 ];
omc_error_2 = [ 2.552111e-03 ; 3.519985e-03 ; 5.899967e-03 ];
Tc_error_2  = [ 7.648965e+00 ; 8.289913e+00 ; 3.895203e+00 ];

%-- Image #3:
omc_3 = [ 1.697073e+00 ; 1.708579e+00 ; -7.768283e-01 ];
Tc_3  = [ -3.407371e+02 ; -1.827972e+02 ; 2.131813e+03 ];
omc_error_3 = [ 2.739320e-03 ; 3.681601e-03 ; 5.085192e-03 ];
Tc_error_3  = [ 7.991750e+00 ; 8.671467e+00 ; 3.918177e+00 ];

%-- Image #4:
omc_4 = [ 1.590120e+00 ; 1.571252e+00 ; -9.003110e-01 ];
Tc_4  = [ -3.389252e+02 ; -1.817649e+02 ; 2.110624e+03 ];
omc_error_4 = [ 2.942654e-03 ; 3.781888e-03 ; 4.673361e-03 ];
Tc_error_4  = [ 7.918758e+00 ; 8.587932e+00 ; 3.817424e+00 ];

%-- Image #5:
omc_5 = [ -2.033787e+00 ; -2.048328e+00 ; -4.425348e-01 ];
Tc_5  = [ -3.532279e+02 ; -2.090044e+02 ; 1.654124e+03 ];
omc_error_5 = [ 3.011655e-03 ; 3.460541e-03 ; 6.193297e-03 ];
Tc_error_5  = [ 6.210639e+00 ; 6.769443e+00 ; 3.795499e+00 ];

%-- Image #6:
omc_6 = [ -1.862152e+00 ; -1.895324e+00 ; -6.576692e-01 ];
Tc_6  = [ -3.384957e+02 ; -1.153721e+02 ; 1.500421e+03 ];
omc_error_6 = [ 2.880367e-03 ; 3.570528e-03 ; 5.452677e-03 ];
Tc_error_6  = [ 5.617922e+00 ; 6.137772e+00 ; 3.465121e+00 ];

%-- Image #7:
omc_7 = [ -1.743010e+00 ; -1.778844e+00 ; -7.521549e-01 ];
Tc_7  = [ -3.414026e+02 ; -8.456345e+01 ; 1.364629e+03 ];
omc_error_7 = [ 2.992687e-03 ; 3.600762e-03 ; 5.023599e-03 ];
Tc_error_7  = [ 5.109366e+00 ; 5.596113e+00 ; 3.219018e+00 ];

%-- Image #8:
omc_8 = [ -1.660736e+00 ; -1.684785e+00 ; -8.136209e-01 ];
Tc_8  = [ -3.409731e+02 ; -5.905165e+01 ; 1.246947e+03 ];
omc_error_8 = [ 3.109821e-03 ; 3.624530e-03 ; 4.723662e-03 ];
Tc_error_8  = [ 4.669091e+00 ; 5.125950e+00 ; 3.003749e+00 ];

%-- Image #9:
omc_9 = [ 1.869423e+00 ; 1.656813e+00 ; 8.768343e-01 ];
Tc_9  = [ -3.723458e+02 ; -2.244653e+02 ; 1.675254e+03 ];
omc_error_9 = [ 3.649497e-03 ; 2.389405e-03 ; 5.202304e-03 ];
Tc_error_9  = [ 6.343755e+00 ; 6.871845e+00 ; 3.943566e+00 ];

%-- Image #10:
omc_10 = [ 1.803268e+00 ; 1.508558e+00 ; 1.002406e+00 ];
Tc_10  = [ -3.481046e+02 ; -2.127655e+02 ; 1.627377e+03 ];
omc_error_10 = [ 3.778493e-03 ; 2.500817e-03 ; 4.917465e-03 ];
Tc_error_10  = [ 6.160771e+00 ; 6.665934e+00 ; 3.859541e+00 ];

%-- Image #11:
omc_11 = [ 1.692449e+00 ; 1.383512e+00 ; 1.146795e+00 ];
Tc_11  = [ -3.294819e+02 ; -2.115396e+02 ; 1.592990e+03 ];
omc_error_11 = [ 3.887417e-03 ; 2.721051e-03 ; 4.606172e-03 ];
Tc_error_11  = [ 6.036902e+00 ; 6.522827e+00 ; 3.810077e+00 ];

%-- Image #12:
omc_12 = [ 1.616550e+00 ; 1.306917e+00 ; 1.209938e+00 ];
Tc_12  = [ -3.786910e+02 ; -2.013026e+02 ; 1.635285e+03 ];
omc_error_12 = [ 3.915020e-03 ; 2.839366e-03 ; 4.395498e-03 ];
Tc_error_12  = [ 6.222826e+00 ; 6.724125e+00 ; 3.943226e+00 ];

%-- Image #13:
omc_13 = [ -1.862547e+00 ; -1.874463e+00 ; 4.995489e-01 ];
Tc_13  = [ -2.792468e+02 ; -2.192835e+02 ; 2.008117e+03 ];
omc_error_13 = [ 3.501560e-03 ; 2.675287e-03 ; 5.652328e-03 ];
Tc_error_13  = [ 7.517895e+00 ; 8.140039e+00 ; 3.879653e+00 ];

%-- Image #14:
omc_14 = [ -1.688195e+00 ; -1.741088e+00 ; 7.184896e-01 ];
Tc_14  = [ -2.329125e+02 ; -2.201417e+02 ; 2.037252e+03 ];
omc_error_14 = [ 3.594890e-03 ; 2.793123e-03 ; 5.091558e-03 ];
Tc_error_14  = [ 7.624961e+00 ; 8.250402e+00 ; 3.803374e+00 ];

%-- Image #15:
omc_15 = [ -1.538099e+00 ; -1.582250e+00 ; 8.862409e-01 ];
Tc_15  = [ -1.975732e+02 ; -2.224177e+02 ; 2.103149e+03 ];
omc_error_15 = [ 3.726088e-03 ; 3.008769e-03 ; 4.605135e-03 ];
Tc_error_15  = [ 7.873993e+00 ; 8.511103e+00 ; 3.848234e+00 ];

%-- Image #16:
omc_16 = [ -1.381989e+00 ; -1.561262e+00 ; 9.279916e-01 ];
Tc_16  = [ -1.655100e+02 ; -2.356383e+02 ; 2.129362e+03 ];
omc_error_16 = [ 3.708092e-03 ; 3.207226e-03 ; 4.347743e-03 ];
Tc_error_16  = [ 7.971392e+00 ; 8.612668e+00 ; 3.920476e+00 ];

%-- Image #17:
omc_17 = [ -2.712228e+00 ; -1.500659e+00 ; -1.694825e-01 ];
Tc_17  = [ -4.620755e+02 ; -1.519286e+02 ; 1.772171e+03 ];
omc_error_17 = [ 5.318402e-03 ; 2.760671e-03 ; 8.684424e-03 ];
Tc_error_17  = [ 6.697148e+00 ; 7.254946e+00 ; 4.147622e+00 ];

%-- Image #18:
omc_18 = [ -2.897915e+00 ; -9.549531e-01 ; 1.992175e-02 ];
Tc_18  = [ -5.142579e+02 ; -2.720730e+01 ; 1.823622e+03 ];
omc_error_18 = [ 5.523445e-03 ; 1.507652e-03 ; 8.088029e-03 ];
Tc_error_18  = [ 6.849724e+00 ; 7.468736e+00 ; 4.033416e+00 ];

%-- Image #19:
omc_19 = [ 9.851607e-01 ; 2.786408e+00 ; 1.795592e-01 ];
Tc_19  = [ 4.480546e+01 ; -4.212177e+02 ; 1.880175e+03 ];
omc_error_19 = [ 1.923507e-03 ; 4.851935e-03 ; 7.437960e-03 ];
Tc_error_19  = [ 7.100301e+00 ; 7.621845e+00 ; 4.073726e+00 ];

%-- Image #20:
omc_20 = [ 6.231566e-01 ; 2.827885e+00 ; 1.425456e-01 ];
Tc_20  = [ 1.414900e+02 ; -3.930655e+02 ; 1.935053e+03 ];
omc_error_20 = [ 1.405470e-03 ; 4.788078e-03 ; 6.943640e-03 ];
Tc_error_20  = [ 7.299127e+00 ; 7.830983e+00 ; 4.074419e+00 ];

%-- Image #21:
omc_21 = [ 1.234868e+00 ; 1.641720e+00 ; -3.382669e-01 ];
Tc_21  = [ -3.207912e+02 ; -2.309881e+02 ; 1.981449e+03 ];
omc_error_21 = [ 2.918877e-03 ; 3.447742e-03 ; 4.355598e-03 ];
Tc_error_21  = [ 7.428289e+00 ; 8.049902e+00 ; 3.769644e+00 ];

%-- Image #22:
omc_22 = [ 1.271332e+00 ; 1.570284e+00 ; -5.377668e-01 ];
Tc_22  = [ -3.310543e+02 ; -2.390450e+02 ; 1.991318e+03 ];
omc_error_22 = [ 2.990591e-03 ; 3.571876e-03 ; 4.261894e-03 ];
Tc_error_22  = [ 7.472700e+00 ; 8.097621e+00 ; 3.734059e+00 ];

%-- Image #23:
omc_23 = [ 2.177224e+00 ; 2.225519e+00 ; 5.498653e-02 ];
Tc_23  = [ -3.254403e+02 ; -1.401272e+02 ; 1.995698e+03 ];
omc_error_23 = [ 4.942391e-03 ; 4.875547e-03 ; 1.062321e-02 ];
Tc_error_23  = [ 7.483657e+00 ; 8.104775e+00 ; 4.606586e+00 ];

