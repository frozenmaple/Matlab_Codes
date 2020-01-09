%---------------------------------------------------------------------------------------
% exa010302.m,  for  example 1.3.2
%      ˵�� ��˹�����źŵ�ʱ�����ġ�Ƶ����С��ʱ��ʹ���
%  ע���ڸó����У��õ����ӳ��� loctime,locfreq.m, 
%      ��Щ��������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%----------------------------------------------------------------------------------------
clear;

N=64;
alpha=0.05;f0=0.25
a=alpha/pi;a=sqrt(a);a=sqrt(a);

t1=((1:N)-N/2-1)';
y = exp(-t1.^2 * alpha/2);
y=y.*a;

y1=exp(-i*2*pi*t1*f0);
y=y.*y1;

subplot(221)
plot((-N/2:N/2-1),real(y));grid on;
xlabel(' Gauss modulated signal x(t)');

dsp=fftshift(abs(fft(y)).^2);
subplot(222)
plot((0:N/2-1)./N,dsp(1:N/2));grid on;
xlabel(' the Spectrum of x(t)');

[t0,T]=loctime(y)
t0=t0-N/2-1
[f0,B]=locfreq(y)
T*B


 