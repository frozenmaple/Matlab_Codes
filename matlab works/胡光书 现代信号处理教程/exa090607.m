% -------------------------------------------------------------------
% exa060606.m, for fig 9.6.6
% ���� coif4 С����ʱ���Σ�ͬʱ�����˳߶Ⱥ�����ʱ���Σ� 
%--------------------------------------------------------------------
clear;

iter=4
[phi4,psi4,xval4] = wavefun('coif4',iter);
subplot(2,2,1)
plot(xval4,phi4);grid on
title('Coif4: Phi')
subplot(222)
plot(xval4,psi4);grid on
title('Coif4: Psi')
