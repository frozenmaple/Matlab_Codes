%---------------------------------------------------------------------------------------
% exa010201a.m,  for  example 1.2.2
% 说明信号的子带分解；
%----------------------------------------------------------------------------------------
clear
n=256; w=pi/5; pow=0.08;
u=randn(1,n);
umean=mean(u);
u=u-umean;
u_p=dot(u,u)/n;     %dot 矢量的内积
u=u.*sqrt(pow/u_p);

   for j=1:n
      signal(j)=cos(0.8*w*j)+cos(1.5*w*j);
   end;
   signal=2*signal+u;
%   figure(2)
subplot(211)
plot(signal);grid on;
ylabel(' signal x(t)');

subplot(212)
pf=fft(signal,n);
for i=1:128
   t(i)=(i-1)/256;
   p(i)=abs(pf(i))^2;
   p(i)=10*log10(p(i));
end
plot(t,p);grid on;
ylabel(' Spectrum of x (dB)');

