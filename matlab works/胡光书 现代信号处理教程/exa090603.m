% -------------------------------------------------------------------
% exa090603.m, for fig 9.6.3
% 产生 mexhat 小波的时域波形及频谱 
% 注：在该程序中，用到了子程序 mexhat.m，
%      该程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%--------------------------------------------------------------------
clear;

[wavelet]=mexhat(0.1);
subplot(2,2,1)
plot(wavelet);grid on
%title(' mexhat wavelet: Psi')

a=[1];
   fs=1;
[h,w]=freqz(wavelet,a,256,'whole',fs);
hr=abs(h);
subplot(2,2,2)
plot(w(1:128),hr(1:128));grid on
%title('The FT of Psi')
[fm,B]=locfreq(wavelet')

