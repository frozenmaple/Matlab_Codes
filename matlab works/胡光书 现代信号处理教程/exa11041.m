%-----------------------------------------------------------------
% exa110401.m 产生db2～db9正交小波的尺度函数和小波函数
%------------------------------------------------------------------
clear;

iter=8
[phi2,psi2,xval2] = wavefun('db2',iter);
figure(1)
subplot(2,2,1)
plot(xval2,phi2);grid on
title('phi ')
Ylabel('p=2')
subplot(2,2,2)
plot(xval2,psi2);grid on
title('psi ')
%
[phi3,psi3,xval3] = wavefun('db3',iter);
subplot(2,2,3)
plot(xval3,phi3);grid on
Ylabel(' p=3')
subplot(2,2,4)
plot(xval3,psi3);grid on

figure(2)
[phi4,psi4,xval4] = wavefun('db4',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
title('phi ')


Ylabel(' p=4')
subplot(2,2,2)
plot(xval4,psi4);grid on
title('psi ')

[phi5,psi5,xval5] = wavefun('db5',iter);
subplot(2,2,3)
plot(xval5,phi5);grid on
Ylabel(' p=5')
subplot(2,2,4)
plot(xval5,psi5);grid on


[phi2,psi2,xval2] = wavefun('db6',iter);
figure(3)
subplot(2,2,1)
plot(xval2,phi2);grid on
title('phi ')
Ylabel('p=6')
subplot(2,2,2)
plot(xval2,psi2);grid on
title('psi ')

[phi3,psi3,xval3] = wavefun('db7',iter);
subplot(2,2,3)
plot(xval3,phi3);grid on
Ylabel(' p=7')
subplot(2,2,4)
plot(xval3,psi3);grid on

figure(4)
[phi4,psi4,xval4] = wavefun('db8',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
Ylabel(' p=8')
subplot(2,2,2)
plot(xval4,psi4);grid on

[phi5,psi5,xval5] = wavefun('db9',iter);
subplot(2,2,3)
plot(xval5,phi5);grid on
Ylabel(' p=9')
subplot(2,2,4)
plot(xval5,psi5);grid on


