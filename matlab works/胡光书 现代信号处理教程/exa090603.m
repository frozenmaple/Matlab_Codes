% -------------------------------------------------------------------
% exa090603.m, for fig 9.6.3
% ���� mexhat С����ʱ���μ�Ƶ�� 
% ע���ڸó����У��õ����ӳ��� mexhat.m��
%      �ó�������������µ���վ������:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      ��Ϊ����վ�ϵ�ʱƵ���������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%--------------------------------------------------------------------
clear;

[wavelet]=mexhat(0.1);
subplot(2,2,1)
plot(wavelet);grid on
%title(' mexhat wavelet: Psi')

a=[1];
   fs=1;
[h,w]=freqz(wavelet,a,256,'whole',fs);
hr=abs(h);
subplot(2,2,2)
plot(w(1:128),hr(1:128));grid on
%title('The FT of Psi')
[fm,B]=locfreq(wavelet')

