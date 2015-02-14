function v = windowing(row, col, windowWidth, windowHeight, image)
        % creates vector with color information about each pixel in the
        % window area. RGB values for each pixel are added in order
        
        vLength = windowWidth * windowHeight;
        v = zeros(1, vLength);
        count = 0;
        
        startCoods = [col-floor(windowWidth/2), row-floor(windowHeight/2)];
        [iRows, iColumns] = size(image);
        
        % for each pixel in window
        for windowY=1:windowHeight  
            for windowX=1:windowWidth
                
                % get absolute start coords
                yCood = startCoods(2) + (windowY-1);
                xCood = startCoods(1) + (windowX-1);
               
                count = count+1;
                
                if xCood < 1 || yCood < 1 || xCood > iColumns || yCood > iRows
                   pixValue = double(0); 
                else
                   pixValue = image(yCood,xCood);
                end
                
                v(1, count) = pixValue;
                
            end
        end
        
        
end