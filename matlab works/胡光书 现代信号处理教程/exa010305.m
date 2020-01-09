%---------------------------------------------------------------------------------------
% exa010305.m,  for  example 1.3.5
%      ˵�� ����Ϊ���ǲ��ķ��ȵ����ź��ڳ��ȱ仯ǰ���źŵ�ʱ�����ġ�Ƶ����С��ʱ��
%           �ʹ���ı仯�����
%  ע���ڸó����У��õ����ӳ��� loctime,locfreq.m, 
%      ��Щ��������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%----------------------------------------------------------------------------------------
clear;

echo off
n=32;f0=0.25;
   sig1=1-abs(1-2*(0:n-1)./n);
   y=exp(j*2*pi*(0:n-1).*f0);
   sig1=y.*sig1;

subplot(221)
plot((0:n-1),real(sig1));grid
xlabel('Time');
ylabel('x(t)'); 

subplot(222)
dsp1=fftshift(abs(fft(sig1)).^2); 
plot((-n/2:n/2-1)/n,dsp1); grid;       
xlabel('Normalized frequency');
ylabel('Spectrum of x(t)');

[t0,T]=loctime(sig1')
[ff0,B]=locfreq(sig1')
qx=B/ff0
TBx=T*B

n=2*n;
   sig1=1-abs(1-2*(0:n-1)./n);
   y=exp(j*2*pi*(0:n-1).*f0/2);
   sig1=y.*sig1;

subplot(223)
plot((0:n-1),real(sig1));
xlabel('Time');
ylabel('x(t/2)'); grid

subplot(224)
dsp1=fftshift(abs(fft(sig1)).^2); 
plot((-n/2:n/2-1)/n,dsp1); grid;       
xlabel('Normalized frequency'); 
ylabel('Spectrum of x(t/2)');
[t0,T]=loctime(sig1')
[ff0,B]=locfreq(sig1')
qs=B/ff0
TBs=T*B

