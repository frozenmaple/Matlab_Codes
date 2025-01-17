%---------------------------------------------------------------------------------------
%  exa030302.m,  for  example 3.3.2 and fig 3.3.2
%  说明一复正弦的WVD;
%
%  注：在该程序中，用到了子程序 tfrpwv.m,
%      还要用到显示程序 tfrqview及其他程序，
%      所有这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

n=512;
   w=pi/4;
   for l=1:n
     sig(l)=exp(i*w*l);
   end;

tfrpwv(sig');

