%---------------------------------------------------------------------------------------
% exa010305.m,  for  example 1.3.5
%      说明 幅度为三角波的幅度调制信号在长度变化前后，信号的时间中心、频率最小、时宽
%           和带宽的变化情况；
%  注：在该程序中，用到了子程序 loctime,locfreq.m, 
%      这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

echo off
n=32;f0=0.25;
   sig1=1-abs(1-2*(0:n-1)./n);
   y=exp(j*2*pi*(0:n-1).*f0);
   sig1=y.*sig1;

subplot(221)
plot((0:n-1),real(sig1));grid
xlabel('Time');
ylabel('x(t)'); 

subplot(222)
dsp1=fftshift(abs(fft(sig1)).^2); 
plot((-n/2:n/2-1)/n,dsp1); grid;       
xlabel('Normalized frequency');
ylabel('Spectrum of x(t)');

[t0,T]=loctime(sig1')
[ff0,B]=locfreq(sig1')
qx=B/ff0
TBx=T*B

n=2*n;
   sig1=1-abs(1-2*(0:n-1)./n);
   y=exp(j*2*pi*(0:n-1).*f0/2);
   sig1=y.*sig1;

subplot(223)
plot((0:n-1),real(sig1));
xlabel('Time');
ylabel('x(t/2)'); grid

subplot(224)
dsp1=fftshift(abs(fft(sig1)).^2); 
plot((-n/2:n/2-1)/n,dsp1); grid;       
xlabel('Normalized frequency'); 
ylabel('Spectrum of x(t/2)');
[t0,T]=loctime(sig1')
[ff0,B]=locfreq(sig1')
qs=B/ff0
TBs=T*B

