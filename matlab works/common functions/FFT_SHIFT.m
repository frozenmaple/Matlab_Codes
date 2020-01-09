function [f,sf] = FFT_SHIFT(t,st)
%这一函数用来直接计算连续时间信号的FFT
%同时频域结果是已经经过移位至0频的
%输入： t抽样时间序列；st时间信号，时间序列长度必须大于2
%输出： f采样频率；sf频域信号

dt=t(2)-t(1);
T=t(end);
df=1/T;
N=length(t);
f=[-N/2:N/2-1]*df;
sf=fft(st);
sf=T/N*fftshift(sf);