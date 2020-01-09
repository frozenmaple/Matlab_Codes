%---------------------------------------------------------------------------------------
% exa010302.m,  for  example 1.3.2
%      说明 高斯调制信号的时间中心、频率最小、时宽和带宽；
%  注：在该程序中，用到了子程序 loctime,locfreq.m, 
%      这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

N=64;
alpha=0.05;f0=0.25
a=alpha/pi;a=sqrt(a);a=sqrt(a);

t1=((1:N)-N/2-1)';
y = exp(-t1.^2 * alpha/2);
y=y.*a;

y1=exp(-i*2*pi*t1*f0);
y=y.*y1;

subplot(221)
plot((-N/2:N/2-1),real(y));grid on;
xlabel(' Gauss modulated signal x(t)');

dsp=fftshift(abs(fft(y)).^2);
subplot(222)
plot((0:N/2-1)./N,dsp(1:N/2));grid on;
xlabel(' the Spectrum of x(t)');

[t0,T]=loctime(y)
t0=t0-N/2-1
[f0,B]=locfreq(y)
T*B


 