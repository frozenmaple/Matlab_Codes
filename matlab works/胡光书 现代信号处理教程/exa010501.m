%---------------------------------------------------------------------------------------
% exa010501a.m,  for  example 1.5.1 and fig 1.5.1
%      给出两个chirp信号相加后，由瞬时频率定义求出的瞬时频率曲线，说明瞬时频率的不确切性；
%  注：在该程序中，用到了子程序 loctime,locfreq.m, instfreq.m，tfrideal.m等，
%      这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

N=128;
[x1,if1]=fmlin(N,0,0.3);
[x2,if2]=fmlin(N,0.2,0.5);
y=x1+x2;
t=1:N;
subplot(311)
plot(t,real(y));grid on;
ylabel('real(x(t))')

subplot(312)
ifr=instfreq(y); 
plot(ifr'); grid;
axis([1 128 0 0.5]);
ylabel(' frequency'); 

subplot(313)
tfrideal([if1,if2]);