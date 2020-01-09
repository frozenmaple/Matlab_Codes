function [f,sf] = FFT_SHIFT(t,st)
%��һ��������ֱ�Ӽ�������ʱ���źŵ�FFT
%ͬʱƵ�������Ѿ�������λ��0Ƶ��
%���룺 t����ʱ�����У�stʱ���źţ�ʱ�����г��ȱ������2
%����� f����Ƶ�ʣ�sfƵ���ź�

dt=t(2)-t(1);
T=t(end);
df=1/T;
N=length(t);
f=[-N/2:N/2-1]*df;
sf=fft(st);
sf=T/N*fftshift(sf);