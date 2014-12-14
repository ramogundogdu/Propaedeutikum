function [RectifiedImageLeft, RectifiedImageRight, PLrect, PRrect] = rectifyImages(ILeft, IRight, KLeft, KRight, R, T)

    % returns rectified left and right image
    %
    % Params:
    % KLeft - Left callibrations matrix
    % KRight - right callibration matrix
    % R - Rotation matrix wrt left camera
    % T - Translation vector wrt left camera


    PlotResults = false;
    
    % Transformation matrizes
    Po1 = KLeft * [1 0 0 0; 0 1 0 0; 0 0 1 0];
    Po2 = KRight * [R T];

    disp('---------------------------------- rectifying...');

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


    disp('---------------------------------- warping...');

    % find the smallest bounding box containining both images
    bb = mcbb(size(ILeft),size(IRight), TL, TR);

    % warp RGB channels,
    for c = 1:3

        % Warp LEFT
        [WarpedILeft(:,:,c),bbL,alphaL] = imwarp2(ILeft(:,:,c), TL, 'bilinear', bb);

        % Warp RIGHT
        [WarpedIRight(:,:,c),bbR,alphaR] = imwarp2(IRight(:,:,c), TR, 'bilinear', bb);

    end

    disp('---------------------------------- warping DONE');
    
    
    RectifiedImageLeft = WarpedILeft;
    RectifiedImageRight = WarpedIRight;
    PLrect = pml;
    PRrect = pmr;
    
    
    % ======= Plots =======
    %
    % plot original and rectified images with feature points
    % and corresponding epipolar lines
    if PlotResults == true
        
        ml = load(['testData/feature_points']);
        
        % === Original Plots ===
        %
        % Epipolar geometry
        [F,epil,epir] = fund(Po1,Po2);
        
        % -------------------- PLOT LEFT VIEW - Original
        %figure(1)
        subplot(2,2,1)
        image(ILeft);
        axis image
        title('Left image');
        hold on
        plot(ml(1,:), ml(2,:),'w+','MarkerSize',12);
        hold off



        % -------------------- PLOT RIGHT VIEW - Original
        %figure(2)
        subplot(2,2,2)
        image(IRight);
        axis image
        title('Right image');
        % plot epipolar lines
        x1 =0;
        x2 = size(IRight,2);
        hold on
        for i=1:size(ml,2)
            liner = F * [ml(:,i) ; 1];
            plotseg(liner,x1,x2);
        end
        hold off
        
        
        
        % === Rectified Plots ===
        %
        % warp tie points
        mlx = p2t(TL,ml);

        % -------------------- PLOT LEFT - Rectified
        %figure(3)
        subplot(2,2,3)
        image(RectifiedImageLeft);
        axis image
        hold on
        title('Rectified left image');
        x2 = size(RectifiedImageLeft,2);
        for i =1:size(mlx,2)
            plot (mlx(1,i)-bbL(1), mlx(2,i)-bbL(2),'w+','MarkerSize',12);
        end
        hold off


        % --------------------  PLOT RIGHT - Rectified
        %figure(4)
        subplot(2,2,4)
        image(RectifiedImageRight);
        axis image
        hold on
        title('Rectified right image')
        x2 = size(RectifiedImageRight,2);
        for i =1:size(mlx,2)
            liner = star([1 0 0])  * [mlx(:,i) - bbL(1:2) ;  1];
            plotseg(liner,x1,x2);
        end
        
    end
    
    disp('---------------------------------- rectification DONE')

end