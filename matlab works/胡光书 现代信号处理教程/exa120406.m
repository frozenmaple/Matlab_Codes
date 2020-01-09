%--------------------------------------------------------------------------
% exa120406.m,   for fig 12.4.6
%--------------------------------------------------------------------------
clear

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior1.3',iter);

subplot(3,2,1)
plot(xval,psi2);grid on
Ylabel('bior1.3  psi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.2',iter);
subplot(3,2,2)
plot(xval,psi2);grid on
Ylabel('bior2.2  psi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.3',iter);
subplot(3,2,3)
plot(xval,psi2);grid on
Ylabel('bior3.3  psi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.5',iter);
subplot(3,2,4)
plot(xval,psi2);grid on
Ylabel('bior3.5  psi-R')
