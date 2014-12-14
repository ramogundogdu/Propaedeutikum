function DispMap = correlationMatching(ILeft, IRight, windowSize)

%   Searches for matching Pixels in rectified images




     if size(ILeft) ~= size(IRight) 
         error('Input images must have equal dimensions');
     end

    [rows, columns, colorDepth] = size(ILeft);

    windowSizeX = windowSize;
    windowSizeY = windowSize;
    
    DispMap = zeros(rows,columns);

    disp('---------------- Matching.... ');

    %for every pixel of the left image
    for i=1:rows
        for j=1:columns

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
     disp('---------------- Matching DONE ');

    

    function cV = windowing(x, y, windowWidth, windowHeight, image)
        % creates vector with color information about each pixel in the
        % window area. RGB values for each pixel are added in order
        
        cV = zeros(1,windowWidth*windowHeight*3);
        count = 0;
        
        startCoods = [x-floor(windowWidth/2), y-floor(windowHeight/2)];
        [iRows, iColumns, iColorDepth] = size(image);
        
        % for each pixel in window
        for windowY=1:windowHeight  
            for windowX=1:windowWidth
                
                % get absolute start coords
                yCood = startCoods(2) + (windowY-1);
                xCood = startCoods(1) + (windowX-1);
               
                count = count+1;
                
                % for each RGB value of pixel
                for c=1:iColorDepth
                    if xCood < 1 || yCood < 1 || xCood > iColumns || yCood > iRows
                       pixValue = 0; 
                    else
                       pixValue = image(xCood,yCood,c); 
                    end

                    cV(1, count) = pixValue;
                end
            end
        end
    end

end

