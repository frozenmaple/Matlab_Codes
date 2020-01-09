%---------------------------------------------------------------------------------------
%  exa060206.m,  for fig 6.2.6
%  计算并显示半带滤波器H0,H1,及 H0+H1的幅频响应
%
%----------------------------------------------------------------------------------------
clear all;

% to design a CQMF filter
N0=512;
% First step: To design a one-band filter G(z)  by Chebyshev approximation
% set the cutoff frequency of the G(w);
F=[0 0.9,1,1];
A=[1 1 0,0];
N=9;
B=remez(N,F,A)
a=1;
wf=0:pi/N0:pi*(N0-1)/N0;
wff=0:1/N0:(N0-1)/N0;
Gw= freqz(B,a,wf);
Ew=exp(i*N*wf/2);
Gr=Ew.*Gw;
% Gr is a zero phase one-band filter,so Gr is real

% To obtain half-band filter F(z) from G(z), 
s=length(B)
B2=zeros(1,2*s-1);
for k=1:s,
   B2(k*2-1)=B(k);
  end, 
N2=length(B2)
B2(N+1)=1+B2(N+1);
B2=B2/2
Fw=freqz(B2,a,wf);
Ew=exp(i*N*wf);
Fr=Ew.*Fw;
Fg=real(Fr);

for i=0:N0-1
   Fh(i+1)=Fg(N0-i);
   Fhg(i+1)=Fg(i+1)+Fh(i+1);
end

figure(1)
plot(wff,Fg);grid on;
title('Hg(w)')
figure(2)

plot(wff,Fh);grid on;
title('Hg(-w)')
figure(3)
plot(wff,Fg,wff,Fh,wff,Fhg,'k.');grid on;
%title(' Hg(w)+Hg(-w)')



