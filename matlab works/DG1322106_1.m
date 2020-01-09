clear all;
close all;

load noisdopp;
s = noisdopp;
n1 = 1;
n2 = 5;
[swa1,swd1] = swt(s,n1,'db1');
[swa2,swd2] = swt(s,n2,'db1');

[THR,SORH,KEEPAPP] = ddencmp('den','wv',s);
Y1 = wthresh(swd1,SORH,THR);
s1 = iswt(swa1,Y1,'db1');

Y2 = wthresh(swd2,SORH,THR);
s2 = iswt(swa2,Y2,'db1');

subplot(131);plot(s);grid on;title('原始信号');
subplot(132);plot(s1);grid on;title('对信号一阶小波分解后的细节降噪后重建');
subplot(133);plot(s2);grid on;title('对信号五阶小波分解后的细节降噪后重建');

