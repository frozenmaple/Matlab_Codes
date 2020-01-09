%--------------------------------------------------------------------------
% exa120408.m,   for fig12.4.8
%--------------------------------------------------------------------------
clear;

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior5.5',iter);

subplot(3,2,1)
plot(xval,phi2);grid on
Ylabel('bior5.5  phi-R')

subplot(3,2,2)
plot(xval,psi2);grid on
Ylabel('bior5.5  psi-R')

subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior5.5  phi-D')

subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior5.5  psi-D')
