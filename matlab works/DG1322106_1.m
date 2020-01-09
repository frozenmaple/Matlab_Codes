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

subplot(131);plot(s);grid on;title('ԭʼ�ź�');
subplot(132);plot(s1);grid on;title('���ź�һ��С���ֽ���ϸ�ڽ�����ؽ�');
subplot(133);plot(s2);grid on;title('���ź����С���ֽ���ϸ�ڽ�����ؽ�');

