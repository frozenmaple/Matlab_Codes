%---------------------------------------------------------------------------------------
% exa010101.m,  for  example 1.1.1
% 说明三个分段相连的信号的傅里叶变换和时频分析；
%  注：在该程序中，用到了子程序 tfstft.m, 还要用到显示程序 tfrqview及其他程序，
%      所有这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
echo off
clear
n=256;
t=1:n;
   w=pi/5;
   for k=1:85,
   %    signal(k)=exp(j*k*w);
        signal(k)=sin(k*w);
   end;
   for k=86:170,
   %    signal(k)=exp(j*2*k*w);
        signal(k)=sin(2*k*w);

   end;
   for k=171:n,
   %    signal(k)=exp(j*3*k*w);
         signal(k)=sin(3*k*w);

   end;

tfrstft(signal');grid on;

