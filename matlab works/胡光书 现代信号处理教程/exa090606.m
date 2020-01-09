% -------------------------------------------------------------------
% exa060606.m, for fig 9.6.6
% 产生 sym4 小波的时域波形，同时给出了尺度函数的时域波形； 
%--------------------------------------------------------------------
clear;

iter=3
[phi4,psi4,xval4] = wavefun('sym4',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
title('Sym4:  Phi')
subplot(2,2,2)
plot(xval4,psi4);grid on
title('Sym4:  Psi')
%
