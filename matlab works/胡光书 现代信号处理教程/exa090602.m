% -------------------------------------------------------------------
% exa060602.m, for fig 9.6.2
% 产生 morlet 小波的时域波形及频谱 
%--------------------------------------------------------------------
clear;

lb=-4;ub=4;n=100;
[wavelet,x]=morlet(lb,ub,n);
subplot(2,2,1)
plot(x,wavelet);grid on
title(' Morlet wavelet: Psi')

a=[1];
   fs=1;
[h,w]=freqz(wavelet,a,256,'whole',fs);
hr=abs(h);
subplot(2,2,2)
plot(w(1:128),hr(1:128));grid on
title('The FT of Psi')


