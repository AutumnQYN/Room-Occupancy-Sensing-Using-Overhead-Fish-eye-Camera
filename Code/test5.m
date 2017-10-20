img_original = im2double(imread('Image1.jpg'));
img_changed = im2double(imread('Image830.jpg'));
c = img_changed - img_original;
figure(3);imshow(c);
img_original = ~im2bw(img_original,80/256);
img_changed = ~im2bw(img_changed,80/256);
d = img_changed - img_original;
figure(1);imshow(d);
img_fill = d;
se = strel('disk',5);
img_fill = imclose(img_fill,se);
img_fill = imfill(d,'holes');
BMW = img_fill;
erodeBW = imerode(BMW,se);
figure(2);imshow(erodeBW);
BMW = bwareaopen(BMW,500);
ram = BMW;
% ram = regiongrow(simage,ram,0.9,0.1);
% ram = BMW;
% ed = edge(ram);
% figure(8),imshow(ed);
figure(5),imshow(ram);
cc = bwconncomp(ram, 4);
[centers, radii] = imfindcircles(ram,[20 55],'ObjectPolarity','bright');
% figure(5),imshow(ed);
img_changed = im2double(imread('Image830.jpg'));
figure(6),imshow(img_changed);
h = viscircles(centers,radii);
text(10,10,strcat('\color{red}Heads Found:',num2str(length(centers))));
