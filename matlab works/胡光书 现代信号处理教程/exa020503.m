%---------------------------------------------------------------------------------------
%  exa020503.m,  for  example 2.5.3 and fig 2.5.1,同时也给出图 2.6.1(a)
%  说明在Gabor变换中，在临界抽样的情况下，若窗函数为高斯窗，则对偶窗是非连续的，
%                     不再具有高斯窗的形状。该程序同时给出了一个信号的Gabor变换；
%  注：在该程序中，用到了子程序  fmlin.m 及tfgabor.m,
%      还要用到显示程序 tfrqview及其他程序，
%      所有这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------

clear
N1=256;
Nh=33;
q=1;
% q=1 表示临界抽样。

sig=fmlin(N1);
h=window(@gausswin,Nh);
h=h/norm(h);
figure(1)
[tfr,dgr,g]=tfrgabor(sig,16,q,h);


figure(2)
subplot(211)
plot(h);grid;
ylabel('h(t)')

subplot(212)
plot(g);grid;
ylabel('g(t)')

 