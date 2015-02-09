function cV = windowing(row, col, windowWidth, windowHeight, image)
        % creates vector with color information about each pixel in the
        % window area. RGB values for each pixel are added in order
        
        cV = zeros(1,windowWidth*windowHeight*3);
        count = 0;
        
        startCoods = [col-floor(windowWidth/2), row-floor(windowHeight/2)];
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
                       pixValue = image(yCood,xCood,c); %changed x and y cood - for testing purpouse
                    end

                    cV(1, count) = pixValue;
                end
            end
        end
end