%-----------------------------------------------------------------
% exa110502.m 产生 coif2,coif3,coif4,coif5 正交小波的尺度函数
%             和小波函数,图11.5.2
%------------------------------------------------------------------
clear;

iter=8
[phi2,psi2,xval2] = wavefun('coif2',iter);
figure(1)
subplot(2,2,1)
plot(xval2,phi2);grid on
title('phi ')
Ylabel('K=2')
subplot(2,2,2)
plot(xval2,psi2);grid on
title('psi ')

[phi3,psi3,xval3] = wavefun('coif3',iter);
subplot(2,2,3)
plot(xval3,phi3);grid on
Ylabel(' K=3')
subplot(2,2,4)
plot(xval3,psi3);grid on

figure(2)
[phi4,psi4,xval4] = wavefun('coif4',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
title('phi ')
Ylabel(' K=4')
subplot(2,2,2)
plot(xval4,psi4);grid on
title('psi ')

[phi5,psi5,xval5] = wavefun('coif5',iter);
subplot(2,2,3)
plot(xval5,phi5);grid on
Ylabel(' K=5')
subplot(2,2,4)
plot(xval5,psi5);grid on
