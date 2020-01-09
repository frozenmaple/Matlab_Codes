%------------------------------------------------------------------
% exa120602_db97, 例12.6.2
% 本程序利用提升方案实现db9/7小波滤波器，并用该小波进行图像的分解
%------------------------------------------------------------------
clear all;

format long;
pho0=double(imread('lena.bmp')); %读取图像
[h,v]=size(pho0);
pho1=zeros(h,v);
pho2=zeros(h,v);
hh=h;

subplot(2,2,1);colormap(gray);imagesc(pho0);axis off; %显示原图像
photemp=pho0;
for lever=1:3 %共进行三级分解
h=floor(hh/2^(lever-1)); v=h;
for i=1:h %对每一行进行分解    
[ca,cd]=lifting_db97(photemp(i,1:h));
pho1(i,1:h)=[ca,cd];
end

for i=1:v %对每一列进行分解
[ca,cd]=lifting_db97(pho1(1:v,i));
pho2(1:v,i)=[ca,cd]';
end
subplot(2,2,lever+1);colormap(gray);imagesc(pho2);axis off; %显示每一级分解后的图像
photemp=pho2;
end
