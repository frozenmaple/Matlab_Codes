% -------------------------------------------------------------------
% exa060604.m, for fig 9.6.4
% 产生 db4 小波的时域波形及频谱，同时给出了尺度函数的时域波形及频谱； 
%--------------------------------------------------------------------
clear all;

iter=4
[phi2,psi2,xval2] = wavefun('db4',iter);
subplot(2,2,1)
plot(xval2,phi2);grid on
title('db4:  Phi')
subplot(2,2,2)
plot(xval2,psi2);grid on
title('db4: Psi')

a=[1];
   fs=1;
[h,w]=freqz(phi2,a,256,'whole',fs);
hr=abs(h);
subplot(2,2,3)
plot(w(1:128),hr(1:128));grid on
title(' The FT of Phi')

[h,w]=freqz(psi2,a,256,'whole',fs);
hr=abs(h);
subplot(2,2,4)
plot(w(1:128),hr(1:128));grid on
title(' The FT of Psi')

%
