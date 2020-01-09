%--------------------------------------------------------------------------
% exa120403.m,   for fig12.4.3
%--------------------------------------------------------------------------
clear

iter=8
[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.2',iter);
figure(1)
subplot(3,2,1)
plot(xval,phi1);grid on
Ylabel('bior2.2  phi-D')
subplot(3,2,2)
plot(xval,psi1);grid on
Ylabel('bior2.2  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.4',iter);
subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior2.4  phi-D')
subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior2.4  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.6',iter);
figure(2)
subplot(3,2,1)
plot(xval,phi1);grid on
Ylabel('bior2.6  phi-D')
subplot(3,2,2)
plot(xval,psi1);grid on
Ylabel('bior2.6  psi-D')

[phi1,psi1,phi2,psi2,xval] = wavefun('bior2.8',iter);
subplot(3,2,3)
plot(xval,phi1);grid on
Ylabel('bior2.8  phi-D')
subplot(3,2,4)
plot(xval,psi1);grid on
Ylabel('bior2.8  psi-D')
