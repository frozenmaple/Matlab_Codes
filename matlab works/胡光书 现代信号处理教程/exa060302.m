%---------------------------------------------------------------------------------------
%  exa060302.m,  for 例6.3.2 和 图 6.3.2
%  利用单带滤波器来设计一个半带滤波器，并显示半带滤波器H0,H1,及 H0+H1的幅频响应
%  单带滤波器的归一化截止频率为0.84,长度＝16，半带滤波器的长度＝31。
%----------------------------------------------------------------------------------------
clear all;

N0=512;
%First step: To design a one-band filter G(z) by Chebyshev approximation
% set the cutoff frequency of the G(w);
F=[0 0.84,1,1];
A=[1 1 0,0];
N=15;
B=remez(N,F,A)
a=1;
wf=0:pi/N0:pi*(N0-1)/N0;
wff=0:1/N0:(N0-1)/N0;
Gw= freqz(B,a,wf);
Ew=exp(i*N*wf/2);
Gr=Ew.*Gw;
% Gr is a zero phase one-band filter,so Gr is real

figure(1);
subplot(2,1,1)
plot(wff,real(Gr));grid on;
title('single-band filter  G(jw)');
subplot(2,1,2)
stem(B,'filled')
title('single-band filter   g(n)')
hold on
plot((0:10),zeros(11),'b');grid on;

% To obtain half-band filter F(z) from G(z), 
% F(z)=[G(z^2)+(N-1)/2]/2
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

figure(2);
subplot(2,1,1)
plot(wff,Fg);grid on;
title('Half-band filter H(jw)');
subplot(2,1,2)
stem(B2,'filled');grid on;
title('Half-band filter h(n)')

hold on
plot((0:20),zeros(21),'b');grid on;

for i=0:N0-1
   Fh(i+1)=Fg(N0-i);
   Fhg(i+1)=Fg(i+1)+Fh(i+1);
end

figure(3)
plot(wff,Fg,'r-',wff,Fh,'g.',wff,Fhg,'b-');;grid on;


