%---------------------------------------------------------------------------------------
% exa010301.m,  for  example 1.3.1
%      ˵�� ��˹�źŵ�ʱ�����ġ�Ƶ����С��ʱ��ʹ���
%  ע���ڸó����У��õ����ӳ��� loctime,locfreq.m, 
%      ��Щ��������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%----------------------------------------------------------------------------------------
clear;
N=64;

alpha=0.05;
a=alpha/pi;a=sqrt(a);a=sqrt(a);

tmt0=((1:N)-N/2-1)';
y = exp(-tmt0.^2 * alpha/2);
y=y.*a;

subplot(221)
plot((-N/2:N/2-1),y);grid on;
xlabel(' Gauss signal x(t)');

subplot(222)
dsp=fftshift(abs(fft(y)).^2);
plot((-N/2:N/2-1)./N,dsp);grid on;
xlabel(' the Spectrum of x(t)');


[t0,T]=loctime(y)
[f0,B]=locfreq(y)
T*B

