%--------------------------------------------------------------------------
% exa070302 , for example 7.3.2 and fig 7.3.6;
% 说明如何设计椭圆滤波器及计算和显示功率互补IIR滤波器的频率响应
% -------------------------------------------------------------------------
clear;

wp=0.42;ws=1-wp;Fs=1;
delta2=0.023;
delta1=0.5-0.5*sqrt(1-delta2*delta2)

rp=-20*log10(1-2*delta1)
rs=-20*log10(delta2)
[n,wn]=ellipord(wp,ws,rp,rs)
[b,a]=ellip(n,rp,rs,wn)

[H0,w]=freqz(b,a,256,Fs);
absH0=abs(H0);
subplot(221)
plot(w,absH0);grid;

subplot(222)
zplane(b,a)

[h0]=impz(b,a,125);
h1=qmf(h0,1);

[H1,F]= freqz(h1,1,256,Fs);
absH1=abs(H1);

subplot(223)
ah0=20*log10(absH0);
ah1=20*log10(absH1);
plot(F,ah0,'k-',F,ah1,'b-');
grid on;

sumh=absH0.*absH0+absH1.*absH1;
sum=10*log10(sumh);
subplot(224)
plot(w,sum);grid;


[z,p,k]=tf2zp(b,a)