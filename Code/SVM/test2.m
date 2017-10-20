%% Train SVM  
clear all;
ReadList1 = dir('/Users/autumnqiu/Desktop/EC520/Project/svm_test/positivesamples/'); % Read Positive Samples
sz1=size(ReadList1);    
label1=ones(sz1(1),1); %Label Positive Samples as 1  

ReadList2  = dir('negative_sample'); % Read Negative Samples 
sz2=size(ReadList2);    
label2=zeros(sz2(1),1); % Label Negative Samples as 0   
label=[label1',label2']';    
total_num=length(label);    
data=zeros(total_num,1764);    
  
% Extract HOG Features of Positive Samples
for i=4:sz1(1)    
   name= ReadList1(i);    
   image=imread(strcat('positivesamples/',name.name));   
   im=imresize(image,[64,64]);    
   img=rgb2gray(im);    
   hog =hogcalculator(img);    
   data(i-3,:)=hog;    
end    
  
% Extract HOG Features of Negative Samples   
for j=4:sz2(1)    
   name= ReadList2(j);    
   image=imread(strcat('negative_sample/',name.name));    
   im=imresize(image,[64,64]);    
   img=rgb2gray(im);    
   hog =hogcalculator(img);    
   data(sz1(1)+j-3,:)=hog;    
end    
  
[train, test] = crossvalind('holdOut',label);    
cp = classperf(label);    
svmStruct = svmtrain(data(train,:),label(train));    
save('svmStrucct') ;
classes = svmclassify(svmStruct,data(test,:));   

classperf(cp,classes,test);    
cp.CorrectRate

load svmStruct 

%% Scan the Image Using Sliding Window

Image = imread('test12.png');
a = Image(:,:,1);
b = Image(:,:,2);
c = Image(:,:,3);
[m,n]=size(Image);
HEAD = 0;
imshow(Image)
hold on;
for k=1:8:(m-8)
   for kk=1:8:(n-98)
       Image = imread('test12.png');    
       B= cat(3,a(k:k+64,kk:kk+64),b(k:k+64,kk:kk+64),c(k:k+64,kk:kk+64));
       B=imresize(B,[64 64]);
       img=rgb2gray(B);    
       hogt =hogcalculator(img);    
       classes = svmclassify(svmStruct,hogt);
       if classes == 1
           HEAD = HEAD+1;
           rectangle('Position',[k,kk,64,64]);
       end
   end
end