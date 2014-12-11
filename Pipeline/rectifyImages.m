function [RectifiedImageLeft, RectifiedImageRight, PLrect, PRrect] = rectifyImages(ILeft, IRight, KLeft, KRight, R, T)

    % returns rectified left and right image
    %
    % Params:
    % KLeft - Left callibrations matrix
    % KRight - right callibration matrix
    % R - Rotation matrix wrt left camera
    % T - Translation vector wrt left camera


    % Transformation matrizes
    Po1 = KLeft * [1 0 0 0; 0 1 0 0; 0 0 1 0];
    Po2 = KRight * [R T];

    disp('---------------------------------- rectifying...')

    %  rectification without centeriing
    [TL,TR,pml,pmr] = rectify(Po1,Po2);

    % centering LEFT image
    p = [size(ILeft,1)/2; size(ILeft,2)/2; 1];
    px = TL * p;
    dL = p(1:2) - px(1:2)./px(3);

    % centering RIGHT image
    p2 = [size(IRight,1)/2; size(IRight,2)/2; 1];
    px2 = TR * p2; 
    dR = p2(1:2) - px2(1:2)./px2(3);

    % vertical diplacement must be the same
    dL(2) = dR(2);


    % rectification with centering
    [TL,TR,pml,pmr] = rectify(Po1,Po2,dL,dR);


    disp('---------------------------------- warping...')

    % find the smallest bounding box containining both images
    bb = mcbb(size(ILeft),size(IRight), TL, TR);

    % warp RGB channels,
    for c = 1:3

        % Warp LEFT
        [WarpedILeft(:,:,c),bbL,alphaL] = imwarp2(ILeft(:,:,c), TL, 'bilinear', bb);

        % Warp RIGHT
        [WarpedIRight(:,:,c),bbR,alphaR] = imwarp2(IRight(:,:,c), TR, 'bilinear', bb);

    end

    disp('---------------------------------- warping DONE')
    
    
    RectifiedImageLeft = WarpedILeft;
    RectifiedImageRight = WarpedIRight;
    PLrect = pml;
    PRrect = pmr;

end