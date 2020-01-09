%--------------------------------------------------------------------------
% exa120405.m,   for fig 12.4.5
%--------------------------------------------------------------------------
clear

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior1.3',iter);

subplot(3,2,1)
plot(xval,phi2);grid on
Ylabel('bior1.3  phi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.2',iter);
subplot(3,2,2)
plot(xval,phi2);grid on
Ylabel('bior2.2  phi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.1',iter);
subplot(3,2,3)
plot(xval,phi2);grid on
Ylabel('bior3.1  phi-R')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior4.4',iter);
subplot(3,2,4)
plot(xval,phi2);grid on
Ylabel('bior4.4  phi-R')
