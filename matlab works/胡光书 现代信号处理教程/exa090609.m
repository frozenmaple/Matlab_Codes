% -------------------------------------------------------------------
% exa060609.m, for fig 9.6.9
% 产生双正交小波 bior3.7 的时域波形，同时给出了尺度函数的时域波形； 
% phi1,psi1是分解用小波和尺度函数，phi2,psi2 是重建用小波和尺度函数；
%--------------------------------------------------------------------
clear;

iter=4
[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.7',iter);
subplot(2,2,1)
plot(xval,phi1);grid on
title('Dec. scalling function:Phi')
subplot(2,2,2)
plot(xval,psi1);grid on
title('Dec. wavelet function:Psi')
subplot(2,2,3)
plot(xval,phi2);grid on
title('Rec. scalling function:Phi')
subplot(2,2,4)
plot(xval,psi2);grid on
title('Rec. wavelet function:Psi')
