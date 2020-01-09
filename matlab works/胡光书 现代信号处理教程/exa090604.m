% -------------------------------------------------------------------
% exa060604.m, for fig 9.6.4
% 产生 gauswavf 小波的时域波形及频谱 
%--------------------------------------------------------------------
clear;

[f,x]=gauswavf(-6,6,128,4);
subplot(221)
%stem(f)
plot(x,f);grid on
title('Gaussian wavelet: Psi')
a=[1];
   fs=1;
[h,w]=freqz(f,a,256,'whole',fs);
hr=abs(h);
subplot(222)
plot(w(1:128),hr(1:128),'r');grid on
title(' The FT of Psi')

