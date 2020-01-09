%---------------------------------------------------------------------------------------
% exa010303.m,  for  example 1.3.3
%      说明 高斯调制Chirp信号的时间中心、频率最小、时宽和带宽；
%  注：在该程序中，用到了子程序 fmlin,amgauss,loctime,locfreq.m, 
%      这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

N=256;
sig1=fmlin(N).*amgauss(N);
subplot(221)
plot(real(sig1));
xlabel('Time'); 
ylabel('Real part of x(t)');
title('Linear frequency modulation'); grid

dsp1=fftshift(abs(fft(sig1)).^2); 
subplot(222)
plot((-N/2:N/2-1)/N,dsp1); grid;       

xlabel('Normalized frequency'); 
ylabel('the Spectrum of x(t)');

[t0,T]=loctime(sig1)
[f0,B]=locfreq(sig1)
T*B

