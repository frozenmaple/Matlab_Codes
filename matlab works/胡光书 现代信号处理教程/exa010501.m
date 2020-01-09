%---------------------------------------------------------------------------------------
% exa010501a.m,  for  example 1.5.1 and fig 1.5.1
%      ��������chirp�ź���Ӻ���˲ʱƵ�ʶ��������˲ʱƵ�����ߣ�˵��˲ʱƵ�ʵĲ�ȷ���ԣ�
%  ע���ڸó����У��õ����ӳ��� loctime,locfreq.m, instfreq.m��tfrideal.m�ȣ�
%      ��Щ��������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%----------------------------------------------------------------------------------------
clear;

N=128;
[x1,if1]=fmlin(N,0,0.3);
[x2,if2]=fmlin(N,0.2,0.5);
y=x1+x2;
t=1:N;
subplot(311)
plot(t,real(y));grid on;
ylabel('real(x(t))')

subplot(312)
ifr=instfreq(y); 
plot(ifr'); grid;
axis([1 128 0 0.5]);
ylabel(' frequency'); 

subplot(313)
tfrideal([if1,if2]);