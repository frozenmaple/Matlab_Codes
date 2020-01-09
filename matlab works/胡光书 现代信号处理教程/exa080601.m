%-------------------------------------------------------------------------------
% exa080601.m,  for example 8.5.1
% 设计一个 8 通道的余弦调制滤波器组;
% 本程序调用了子程序opt_filter.m 及 ovlp_ripple.m，摘自文献：
%  S. K. Mitra.  Digital Signal Processing: A Computer-Based Approach. Second Edition,
%                McGraw-Hill,2001; 清华大学出版社，2001
%-------------------------------------------------------------------------------
clear all;

N=127;nbands=8;
[hopt,H,G]=opt_filter(N,nbands);
subplot(221)
stem(hopt,'k');grid;

  h0=H(1,:);
     h1=H(2,:);
     h2=H(3,:);
     h3=H(4,:);
     h4=H(5,:);
     h5=H(6,:);
     h6=H(7,:);
     h7=H(8,:);
subplot(223);
stem(h0,'k.');grid;
[H0,w]=freqz(h0,1,512,1);
[H1,w]=freqz(h1,1,512,1);
[H2,w]=freqz(h2,1,512,1);
[H3,w]=freqz(h3,1,512,1);
[H4,w]=freqz(h4,1,512,1);
[H5,w]=freqz(h5,1,512,1);
[H6,w]=freqz(h6,1,512,1);
[H7,w]=freqz(h7,1,512,1);
 h00=20*log10(abs(H0+0.0000001));
 h11=20*log10(abs(H1+0.0000001));
 h22=20*log10(abs(H2+0.0000001));
 h33=20*log10(abs(H3+0.0000001)); 
 h44=20*log10(abs(H4+0.0000001)); 
 h55=20*log10(abs(H5+0.0000001)); 
 h66=20*log10(abs(H6+0.0000001));
 h77=20*log10(abs(H7+0.0000001));
subplot(222);
plot(w,h00,w,h11,w,h22,w,h33,w,h44,w,h55,w,h66,w,h77);grid;

sumh=abs(H0).*abs(H0)+abs(H1).*abs(H1)+abs(H2).*abs(H2)+abs(H3).*abs(H3);
sumh=sumh+abs(H4).*abs(H4)+abs(H5).*abs(H5)+abs(H6).*abs(H6)+abs(H7).*abs(H7);
sum=10*log10(sumh);
subplot(224);
plot(w,sum);grid;














