function DispMap = correlationMatchingWinAvMasked(ILeft, IRight, windowSize)

%   Searches for matching Pixels in rectified images




     if size(ILeft) ~= size(IRight) 
         error('Input images must have equal dimensions');
     end

     ILeftSW = rgb2gray(ILeft);
     IRightSW = rgb2gray(IRight);
     
     ILeftDouble = im2double(ILeftSW);
     IRightDouble = im2double(IRightSW);
     
     
    [rows, columns] = size(ILeftDouble);
    
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
            [wL, wLAvg] = windowing(i, j, windowSizeX, windowSizeY, ILeftDouble);
            scalarValues = zeros(1, columns);

            for k=1:columns
                %window for each pixel on epipolar line
                [wR,wRAvg] = windowing(i, k, windowSizeX, windowSizeY, IRightDouble);
                
                % scalar product (cosinus) of both window vektors             
                NCC = (dot((wL - wLAvg), (wR - wRAvg)) / (norm(wL - wLAvg) * norm(wR - wRAvg)));
                
                % save result of window comparison
                
                % TODO cut out values below 0.5
                scalarValues(1, k) = NCC  
            end
            
            [M, I] = max(scalarValues);
            
            MatchDisparity = I - j;
            
            DispMap(i,j) = MatchDisparity;

        end
    end
    
    toc
    
    disp('---------------- Matching DONE ');


end

