imageLeft = imread('left-2.gif','gif');
imageRight = imread('right15-2.gif','gif');

DispMap = correlationMatching(imageLeft, imageRight);