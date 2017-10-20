

simage = imread('test1.png'); %input compressed image
simage_changed = imread('test2.png');
simage = imsubtract(simage_changed,simage);
simage = rgb2gray(simage);%converting rgb to gray
figure,imshow(simage);
T=80;%threshold value from histogram
BW = im2bw(simage, T/255);%converting to binary
figure(1),imshow(BW);
d=imdistline;
se = strel('disk',6);
BMW = imdilate(BW,se);%applying dilation
figure(2),imshow(BMW);%applying erosion
erodeBW = imerode(BMW,se);
figure(3),imshow(erodeBW);
ram=~erodeBW;
cc = bwconncomp(ram, 4);
[centers, radii] = imfindcircles(ram,[35 105],'ObjectPolarity','bright', 'Sensitivity',0.82);
figure(4),imshow(~ram);
h = viscircles(centers,radii);
text(10,10,strcat('\color{green}Heads Found:',num2str(length(centers))));
head = false(size(ram));
head(cc.PixelIdxList{2}) = true;
figure(5),imshow(head);
[L,num] = bwlabel(ram,4);
[r,c] = find(L == 1);
cc
B = bwboundaries(ram);
figure(6),imshow(ram)
text(10,10,strcat('\color{green}Heads Found:',num2str(num)))
hold on

for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 0.2)
end