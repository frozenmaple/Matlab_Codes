%----------------------------------------------------------------------------
% exa070502.m  for example 7.5.2 and fig 7.5.2
% 本程序说明如何利用两通道滤波器组实现信号的分解和重建；
%---------------------------------------------------------------------------
clear all
load h0;  % h0 是由 exa070501.m 设计出的低通分析滤波器；
h1=qmf(h0,1);
g0=-wrev(h0);
g1=qmf(g0);

fs=200;f1=5;f2=20;
N=1000;n=1:N;
Sig1=2*sin(2*pi*f1*n/fs);
Sig2=2*sin(2*pi*f2*n/fs);
P1=var(Sig1+Sig2)
Nos=0.2*randn(N,1);
P2=var(Nos);
snr=10*log10(P1/P2)
Sig=Sig1'+Sig2'+Nos;
% Sig 是试验信号，它由两个实正弦加白噪声组成，信噪比约为20dB;

% 2.   signal v0(n) and v1(n) after decompositon and decimation
x0=filter(h0,1,Sig);
v0=decimate(x0,2); %low pass
x1=filter(h1,1,Sig);
v1=decimate(x1,2);  % high pass

% 3.   reconstructed signal by filter  [g0(n) g1(n)]
u0=interp(v0,2);
u1=interp(v1,2);
x_recon=filter(g0,1,u0)+filter(g1,1,u1);

subplot(311)
plot(Sig(45:165));grid;
subplot(312)
plot(x_recon(50:170));grid;
subplot(313)
plot(Sig(45:165),'k');grid;
hold on
plot(x_recon(50:170),'b');

