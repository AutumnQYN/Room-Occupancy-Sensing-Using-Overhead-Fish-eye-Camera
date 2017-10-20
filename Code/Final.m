clear all;
clc;
image = imread('test7.jpg'); %input compressed imaget

imager = image(:,:,1);
imageg = image(:,:,2);
imageb = image(:,:,3);
H = [-1,-1,-1;
     -1,12,-1;
     -1,-1,-1];
R = conv2(double(imager),double(H),'same');
G = conv2(double(imageg),double(H),'same');
B = conv2(double(imageb),double(H),'same');

image(:,:,1) = R;
image(:,:,2) = G;
image(:,:,3) = B;
figure(9),imshow(image);


timage = imread('test6.jpg');
timage = uint8(timage);
timage = timage(:,:,1);
simage = imsubtract(simage,timage);
imshow(simage);
simage = rgb2gray(image);%converting rgb to gray

simage=histeq(simage,256);
simage=histeq(simage,256);
simage=histeq(simage,256);
simage=histeq(simage,256);simage=histeq(simage,256);
simage=histeq(simage,256);


figure(1),imshow(simage);
T=90;%threshold value from histogram
BW = im2bw(image, T/255);%converting to binary
BW = ~BW;
figure(2),imshow(BW);
d=imdistline;
img_fill = BW;
% img_fill = imfill(BW,'holes');
se = strel('disk',2);
BW = imclose(img_fill,se);
img_fill = imfill(BW,'holes');
BMW = img_fill;
BMW = imdilate(BW,se);%applying dilation
figure(3),imshow(BMW);%applying erosion
erodeBW = imerode(BMW,se);
figure(4),imshow(erodeBW);
ram=erodeBW;
BMW = bwareaopen(BMW,500);
ram = BMW;
ram = regiongrow(simage,ram,0.9,0.1);
ram = BMW;
ed = edge(ram);
figure(8),imshow(ed);
figure(5),imshow(ram);
cc = bwconncomp(ram, 4);
[centers, radii] = imfindcircles(ram,[18 40],'ObjectPolarity','bright');
figure(5),imshow(ed);
figure(6),imshow(image);
h = viscircles(centers,radii);
text(10,10,strcat('\color{red}Heads Found:',num2str(length(centers))));
head = false(size(ram));
% head(cc.PixelIdxList{2}) = true;
figure(6),imshow(head);
[L,num] = bwlabel(ram,4);
[r,c] = find(L == 1);

B = bwboundaries(ram,'noholes');



figure(7),imshow(ram)
text(10,10,strcat('\color{green}Heads Found:',num2str(num)))
hold on

for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
end