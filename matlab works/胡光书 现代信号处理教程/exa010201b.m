%---------------------------------------------------------------------------------------
% exa010201b.m,  for  example 1.2.3
% 说明信号的子带分解；
%----------------------------------------------------------------------------------------
clear;

%以下内容涉及到涉及对信号分解的半带滤波器，具体方法见本书第7章；
%-------------------------------------------------------------------------------
N=25;
Wp=0.46
F=[0 2*Wp 1 1];
A=[1 1 0 0];
W=[1 1];
G=remez(N,F,A,W);
for j=1:N+1
   tmp(2*j-1)=0.5*G(j);
   tmp(2*j)=0;
end
P=tmp(1:(2*N+1));
P(N+1)=P(N+1)+0.5;
[H,w1]=freqz(P,1);
err=max(abs(H))-1
P(N+1)=P(N+1)+err;

P=P*0.5/(0.5+err);
[h0,P1]=resolve(P)
h1=qmf(h0,1)
%-------------------------------------------------------------------------------

%产生实验信号x（n）；
n=256;
w=pi/5;
pow=0.08;
u=randn(1,n);
umean=mean(u);
u=u-umean;
u_p=dot(u,u)/n;
u=u.*sqrt(pow/u_p);
   for j=1:n
      x(j)=cos(0.8*w*j)+cos(1.5*w*j);
   end;
   x=2*x+u;
   
% 信号分解，并显示分解后的信号；
x0=filter(h0,1,x);
x1=filter(h1,1,x);
figure(1)
subplot(221)
plot(x0);grid on;
ylabel(' x0(n)');
subplot(222)
plot(x1);grid on;
ylabel(' x1(n)');

% 显示分解后信号的频谱；
w=0:1/n:0.5-1/n;
subplot(223)
x00=fft(x0);
x00=20*log10(abs(x00));
plot(w,x00(1:n/2));grid on;
ylabel(' the Spectrum of x0(dB)');
subplot(224)
x11=fft(x1);
x11=20*log10(abs(x11));
plot(w,x11(1:n/2));grid on;
ylabel(' the Spectrum of x1(dB)');

