function DispMap = correlationMatching(ILeft, IRight, windowSize)

%   Searches for matching Pixels in rectified images




     if size(ILeft) ~= size(IRight) 
         error('Input images must have equal dimensions');
     end

    [rows, columns, colorDepth] = size(ILeft);
    
    rowCount = 0;

    windowSizeX = windowSize;
    windowSizeY = windowSize;
    
    DispMap = zeros(rows,columns);

    disp('---------------- Matching.... ');
    
    tic
    
    %for every pixel of the left image
    for i=1:rows
        
        rowCount = rowCount+1;
        str = sprintf('row %d of %d',rowCount,rows);
        disp(str);
        
        parfor j=1:columns

            % window for left pixel
            wL = windowing(i, j, windowSizeX, windowSizeY, ILeft);
            scalarValues = zeros(1, columns);

            for k=1:columns
                %window for each pixel on epipolar line
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

