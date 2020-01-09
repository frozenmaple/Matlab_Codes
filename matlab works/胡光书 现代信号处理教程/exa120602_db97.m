%------------------------------------------------------------------
% exa120602_db97, ��12.6.2
% ������������������ʵ��db9/7С���˲��������ø�С������ͼ��ķֽ�
%------------------------------------------------------------------
clear all;

format long;
pho0=double(imread('lena.bmp')); %��ȡͼ��
[h,v]=size(pho0);
pho1=zeros(h,v);
pho2=zeros(h,v);
hh=h;

subplot(2,2,1);colormap(gray);imagesc(pho0);axis off; %��ʾԭͼ��
photemp=pho0;
for lever=1:3 %�����������ֽ�
h=floor(hh/2^(lever-1)); v=h;
for i=1:h %��ÿһ�н��зֽ�    
[ca,cd]=lifting_db97(photemp(i,1:h));
pho1(i,1:h)=[ca,cd];
end

for i=1:v %��ÿһ�н��зֽ�
[ca,cd]=lifting_db97(pho1(1:v,i));
pho2(1:v,i)=[ca,cd]';
end
subplot(2,2,lever+1);colormap(gray);imagesc(pho2);axis off; %��ʾÿһ���ֽ���ͼ��
photemp=pho2;
end
