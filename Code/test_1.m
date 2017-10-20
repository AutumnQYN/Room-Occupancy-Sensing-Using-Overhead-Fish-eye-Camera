img_orig = imread('test1.png');
img_orig = rgb2gray(img_orig);
img_change = imread('test2.png');
img_change = rgb2gray(img_change);

img_subtract = imsubtract(img_change,img_orig);
imshow(img_subtract);

img_absdiff = imabsdiff(img_change,img_orig);
imshow(img_absdiff);

% img_2bw = im2bw(img_absdiff);
% imshow(img_2bw);

