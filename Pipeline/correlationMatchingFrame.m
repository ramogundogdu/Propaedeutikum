function DispMap = correlationMatchingFrame(ILeft, IRight, windowSize, FrameO, FrameDim)

%   Searches for matching Pixels in rectified images




     if size(ILeft) ~= size(IRight) 
         error('Input images must have equal dimensions');
     end

    [rows, columns, colorDepth] = size(ILeft);
    
    FrameTopLeft = FrameO;
    FrameBottomRight = [FrameO(1)+FrameDim(1), FrameO(2)+FrameDim(2)];
    
    frameRows = FrameDim(2)
    frameRowCount = 0

    windowSizeX = windowSize;
    windowSizeY = windowSize;
    
    DispMap = zeros(rows,columns);

    disp('---------------- Matching.... ');
    
    tic
    
    %for every pixel in the test frame of the left image
    for i=FrameTopLeft(2):4:FrameBottomRight(2)
        
        frameRowCount = frameRowCount+1;
        str = sprintf('row %d of %d',frameRowCount,frameRows);
        disp(str);
        
        for j=FrameTopLeft(1):4:FrameBottomRight(1)

            % window for left pixel
            wL = windowing(i, j, windowSizeX, windowSizeY, ILeft);
            scalarValues = zeros(1, columns);
            
            % for each pixel on epipolar line of right image
            parfor k=1:columns
                % build window 
                wR = windowing(i, k, windowSizeX, windowSizeY, IRight);
                
                % scalar product (cosinus) of both window vektors             
                cos = (dot(wL,wR)) / (norm(wL) * norm(wR));
                
                % save result of window comparison
                scalarValues(1, k) = cos;  
            end
            
            [M, I] = max(scalarValues);
            
            MatchDisparity = I - j;
            
            DispMap(i,j) = MatchDisparity;

        end
    end
    
    toc
    
    disp('---------------- Matching DONE ');

end

