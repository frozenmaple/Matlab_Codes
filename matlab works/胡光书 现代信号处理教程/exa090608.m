% -------------------------------------------------------------------
% exa060607.m, for fig 9.6.7
% 产生 meyer 小波的时域波形，同时给出了尺度函数的时域波形； 
%--------------------------------------------------------------------
clear;

lowb=-8;uppb=8;n=128;
[scaling,wavelet,t]=meyer(lowb,uppb,n);

subplot(2,2,1)
plot(t,scaling);grid on
subplot(2,2,2)
plot(t,wavelet);grid on

