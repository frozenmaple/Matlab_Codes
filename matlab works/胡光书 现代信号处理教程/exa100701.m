%----------------------------------------------------------------------
% exa100701.m,  ��10.7.1 ��ͼ 10.7.5
%  �����źŵĶ�ֱ��ʷֽ���ؽ������ú����ӳ���wavelet_decwavelet_rec
%  ʹ��  A'trous �㷨���ڷֽ�Ĺ����У�ͬʱ����������ϸ�ں͸�ò������
%  ��ԭ��������ͬ���ĳ��ȡ�
%----------------------------------------------------------------------
clf

f1=1;f2=20;f3=40;fs=200;N=400;
omiga=2*pi/fs;
t=0:N-1;
s1=sin(f1*omiga*t);
s2=sin(f2*omiga*t);
s3=sin(f3*omiga*t);
s=s1+s2+s3;
figure(1)
subplot(521);plot(s);Ylabel('x(t)')
subplot(522);plot(s);Ylabel('x(t)')

wname='sym8';
deccoef=wavelet_dec(s,4,wname);

sig = wavelet_rec(deccoef,4,wname)
figure(2)
subplot(211)
plot(s)
subplot(212)
plot(sig*sqrt(2))