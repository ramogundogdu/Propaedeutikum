function DispMap = correlationMatchingWinAvMasked(ILeft, IRight, windowSize)

%   Searches for matching Pixels in rectified images

     if size(ILeft) ~= size(IRight) 
         error('Input images must have equal dimensions');
     end
    
     % expected rounding error
     RE = 1e-12;
        
    [rows, columns] = size(ILeft);
    
    rowCount = 0;

    windowSizeX = windowSize;
    windowSizeY = windowSize;
    
    % init map of NaNs
    DispMap = NaN(rows,columns);

    disp('---------------- Matching.... ');
    
    tic
    
    %for every pixel of the left image
    for i=1:rows
        
        rowCount = rowCount+1;
        str = sprintf('row %d of %d',rowCount,rows);
        disp(str);
        
        for j=1:columns

            % skip masked (white) pixel
            if (ILeft(i,j) >= 1-RE)
                continue;
            end
            
            % window for left pixel
            wL = windowing(i, j, windowSizeX, windowSizeY, ILeft);
            scalarValues = zeros(1, columns);

            for k=1:columns
                
                % skip masked (white) pixel
                if (IRight(i,k) >= 1-RE)
                    continue;
                end
            
                %window for each pixel on epipolar line
                wR = windowing(i, k, windowSizeX, windowSizeY, IRight);
                
                % scalar product (cosinus) of both window vektors
                nccVal = abs( NCC(wL, wR) );
                  
                % save result of window comparison             
                % cut out values below 0.5
                if( nccVal >= 0.5 )  
                    scalarValues(1, k) = nccVal;  
                end
                
            end
            
            [M, I] = max(scalarValues);
            
            MatchDisparity = I - j;
            
            DispMap(i,j) = MatchDisparity;

        end
    end
    
    toc
    
    disp('---------------- Matching DONE ');


end

