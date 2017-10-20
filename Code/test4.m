clear all
clc
simage = imread('test3.jpg'); %input compressed image
simage = rgb2gray(simage);%converting rgb to gray
figure,imshow(simage);
T=80;%threshold value from histogram
BW = im2bw(simage, T/255);%converting to binary
figure,imshow(BW);
d=imdistline;
se = strel('disk',2);
BMW = imdilate(BW,se);%applying dilation
figure,imshow(BMW);%applying erosion
erodeBW = imerode(BMW,se);
figure,imshow(erodeBW);
ram=~erodeBW;
cc = bwconncomp(ram, 4);
[centers, radii] = imfindcircles(ram,[35 105],'ObjectPolarity','bright', 'Sensitivity',0.92);
figure,imshow(~ram);
h = viscircles(centers,radii);
text(10,10,strcat('\color{green}Heads Found:',num2str(length(centers))));
head = false(size(ram));
head(cc.PixelIdxList{2}) = true;
figure,imshow(head);
[L,num] = bwlabel(ram,4);
[r,c] = find(L == 1);
cc
B = bwboundaries(ram);
figure,imshow(ram)
text(10,10,strcat('\color{green}Heads Found:',num2str(num)))
hold on

for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 0.2)
end