%----------------------------------------------------------------------
% exa100701.m,  例10.7.1 和图 10.7.5
%  用于信号的多分辨率分解和重建。调用函数子程序wavelet_decwavelet_rec
%  使用  A'trous 算法；在分解的过程中，同时给出各级的细节和概貌，它们
%  和原数据有着同样的长度。
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