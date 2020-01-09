%--------------------------------------------------------------------------
% exa120404.m,   for fig12.4.4
%--------------------------------------------------------------------------
clear

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.3',iter);
figure(1)
subplot(3,2,1)
plot(xval,phi1);grid on
Ylabel('bior3.3  phi-D')
subplot(3,2,2)
plot(xval,psi1);grid on
Ylabel('bior3.3  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.5',iter);
subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior3.5  phi-D')
subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior3.5  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.7',iter);
figure(2)
subplot(3,2,1)
plot(xval,phi1);grid on
Ylabel('bior3.7  phi-D')
subplot(3,2,2)
plot(xval,psi1);grid on
Ylabel('bior3.7  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior3.9',iter);
subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior3.9  phi-D')
subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior3.9  psi-D')
