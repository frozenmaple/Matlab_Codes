%---------------------------------------------------------------------------------------
% exa010301.m,  for  example 1.3.1
%      说明 高斯信号的时间中心、频率最小、时宽和带宽；
%  注：在该程序中，用到了子程序 loctime,locfreq.m, 
%      这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;
N=64;

alpha=0.05;
a=alpha/pi;a=sqrt(a);a=sqrt(a);

tmt0=((1:N)-N/2-1)';
y = exp(-tmt0.^2 * alpha/2);
y=y.*a;

subplot(221)
plot((-N/2:N/2-1),y);grid on;
xlabel(' Gauss signal x(t)');

subplot(222)
dsp=fftshift(abs(fft(y)).^2);
plot((-N/2:N/2-1)./N,dsp);grid on;
xlabel(' the Spectrum of x(t)');


[t0,T]=loctime(y)
[f0,B]=locfreq(y)
T*B

