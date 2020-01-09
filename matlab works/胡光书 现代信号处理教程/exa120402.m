%--------------------------------------------------------------------------
% exa120402.m,   for fig12.4.2
%--------------------------------------------------------------------------
clear;

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior1.3',iter);

figure(1)
subplot(3,2,1)
plot(xval,phi1);grid on
Ylabel('bior1.3  phi-D')
subplot(3,2,2)
plot(xval,psi1);grid on
Ylabel('bior1.3  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior1.5',iter);
subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior1.5  phi-D')
subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior1.5  psi-D')

