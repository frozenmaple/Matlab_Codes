% -------------------------------------------------------------------
% exa060607.m, for fig 9.6.7
% ���� meyer С����ʱ���Σ�ͬʱ�����˳߶Ⱥ�����ʱ���Σ� 
%--------------------------------------------------------------------
clear;

lowb=-8;uppb=8;n=128;
[scaling,wavelet,t]=meyer(lowb,uppb,n);

subplot(2,2,1)
plot(t,scaling);grid on
subplot(2,2,2)
plot(t,wavelet);grid on

