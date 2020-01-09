%---------------------------------------------------------------------------------------
% exa010303.m,  for  example 1.3.3
%      ˵�� ��˹����Chirp�źŵ�ʱ�����ġ�Ƶ����С��ʱ��ʹ���
%  ע���ڸó����У��õ����ӳ��� fmlin,amgauss,loctime,locfreq.m, 
%      ��Щ��������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%----------------------------------------------------------------------------------------
clear;

N=256;
sig1=fmlin(N).*amgauss(N);
subplot(221)
plot(real(sig1));
xlabel('Time'); 
ylabel('Real part of x(t)');
title('Linear frequency modulation'); grid

dsp1=fftshift(abs(fft(sig1)).^2); 
subplot(222)
plot((-N/2:N/2-1)/N,dsp1); grid;       

xlabel('Normalized frequency'); 
ylabel('the Spectrum of x(t)');

[t0,T]=loctime(sig1)
[f0,B]=locfreq(sig1)
T*B

