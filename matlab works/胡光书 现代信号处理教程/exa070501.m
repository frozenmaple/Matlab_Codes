%-----------------------------------------------------------------------------------
%  exa070501.m    for example 7.5.1
%  To explain how to design a CQMFB;
%-----------------------------------------------------------------------------------
clear;

% 先设计一个单带滤波器；
N0=512; N=21;Fs=1;
Wp=0.45
F=[0 2*Wp 1 1];
A=[1 1 0 0];
W=[1 1];
a=1;
hsb=remez(N,F,A,W);
[Hsb,w]=freqz(hsb,a,N0,Fs);
figure(1)
subplot(221)
plot(w,abs(Hsb));grid;
%title('single band filter hsb(n)')


% 由单带滤波器得到半带滤波器
for j=1:N+1
   tmp(2*j-1)=0.5*hsb(j);
   tmp(2*j)=0;
end
hlf=tmp(1:(2*N+1));
hlf(N+1)=hlf(N+1)+0.5;

wf=0:pi/N0:pi*(N0-1)/N0;
wff=0:0.5/N0:(N0-1)/N0/2;
a=1;
Gw= freqz(hlf,a,wf);
Ew=exp(i*2*N*wf/2);
Gr=Ew.*Gw;
% Gr 现在是零相位半带滤波器的频率特性，，其虚部应为零，实际上是滤波器的“增益”
mmax=max(real(Gr))
mmin=min(real(Gr))

subplot(222)
plot(wff,real(Gr));grid;
%title('half band filter HLF(z)')

% 获得“增益”恒正的半带滤波器， P+
hlf(N+1)=hlf(N+1)+abs(mmin);
p=hlf*0.5/(0.5+abs(mmin));
subplot(223)
stem(p,'.');grid;
%title('halfband filter p(n)');

Gw= freqz(p,a,wf);
Gr=Ew.*Gw;
subplot(224)
plot(wff,real(Gr));grid;
%title('halfband filter P(z)');
%save p.mat p;
%---------------------------------------------------------------------
% 谱分解部分，求出 h0(n);
l=2*N+1;
A=zeros(l,1);
A(1)=1;
A=A';

figure(2);
subplot(221);
zplane(p,A);
title('the zeros and poles before resolve') 

[Z,P,K]=tf2zp(p,A);
Z1=sort(Z)
ll=length(Z1)/2;
ZZ=Z1(1:ll);
temp=1;
for m=1:ll
    temp=(-ZZ(m))*temp;
end
if imag(temp)<0.0001
   temp=real(temp);
end
KK=sqrt(K/temp);
l2=length(ZZ);
PP=zeros(l2,1);
[h0,P1]=zp2tf(ZZ,PP,KK);
subplot(222)
zplane(h0,P1);
title('the zeros and poles after resolve') 
%-----------------------------------------------------------------------------
% 利用CQMFB四个滤波器之间的关系，得到 h1, g0, g1;
h1=qmf(h0,1);
g0=-wrev(h0);
g1=qmf(g0);

figure(3)
subplot(221)
stem(h0,'.');grid;
title(' filter h0(n)')
subplot(223)
stem(h1,'.');grid;
title(' filter h1(n)')
subplot(222)
stem(g0,'.');grid;
title(' filter g0(n)')
subplot(224)
stem(g1,'.');grid;
title(' filter g1(n)')

% 求出并画出分析滤波器组的对数幅频特性；
[H0,w]= freqz(h0,a,N0,Fs);
[H1,w]= freqz(h1,a,N0,Fs);
absH0=abs(H0);
absH1=abs(H1);
ah0=20*log10(absH0);
ah1=20*log10(absH1);
figure(4)
subplot(221)
plot(w,ah0,'k-',w,ah1,'b-');
grid on;

% 检测两个分析滤波器的功率互补情况；
sumh=absH0.*absH0+absH1.*absH1;
sum=10*log10(sumh);
subplot(222)
plot(w,sum);grid;

save h0.mat h0




