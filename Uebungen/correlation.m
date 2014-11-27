SyntImgLeft = zeros(20,20); 
SyntImgRight = zeros(20,20);

%fill image maps with random sw values

for i=1:20
    for j=1:20
        %SyntImgLeft(i,j) = floor(rand()*256);
        SyntImgLeft(i,j) = i*j;
    end
end

xOff = 3;

for i=1:20
    for j=1:20
        
        if (j+xOff) > 20
            xVal = mod(20, xOff);
        else
            xVal = j+xOff;
        end
        
        SyntImgRight(i,j) = SyntImgLeft(i,xVal);
    end
end

% for i=1:20
%     for j=1:20
%         SyntImgLeft(i,j) = floor(rand()*256);
%         SyntImgRight(i,j) = floor(rand()*256);
%     end
% end
% 
% for i=1:20
%     for j=1:20
%         SyntImgLeft(i,j) = i*j;
%         SyntImgRight(i,j) = i*j;
%     end
% end


% set artificial match
SyntImgLeft(1,1) = 255;
SyntImgRight(1,9) = 255;


%correlation alg.
DispMap = correlationMatching(SyntImgLeft, SyntImgRight);

imLeft = imread('left-2.gif', 'gif');
imRight = imread('right15-2.gif', 'gif');

disp('matching images ...');
DispMap2 = correlationMatching(imLeft, imRight);

disp('matching images ... DONE!');





