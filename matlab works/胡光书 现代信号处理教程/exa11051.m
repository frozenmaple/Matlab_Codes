%-----------------------------------------------------------------
% exa110501.m  产生 sym4,sym6,sym8,sym10 正交小波的尺度函数
%              和小波函数,图11.5.1
%------------------------------------------------------------------
clear;

iter=8
[phi2,psi2,xval2] = wavefun('sym4',iter);
figure(1)
subplot(2,2,1)
plot(xval2,phi2);grid on
title('phi ')
Ylabel('N=4')
subplot(2,2,2)
plot(xval2,psi2);grid on
title('psi ')

[phi3,psi3,xval3] = wavefun('sym6',iter);
subplot(2,2,3)
plot(xval3,phi3);grid on
Ylabel(' N=6')
subplot(2,2,4)
plot(xval3,psi3);grid on

figure(2)
[phi4,psi4,xval4] = wavefun('sym8',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
Ylabel(' N=8')
subplot(2,2,2)
plot(xval4,psi4);grid on

[phi5,psi5,xval5] = wavefun('sym10',iter);
subplot(2,2,3)
plot(xval5,phi5);grid on
Ylabel(' N=10')
subplot(2,2,4)
plot(xval5,psi5);grid on

