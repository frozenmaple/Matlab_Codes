clear all;close all; clc;
Ts=1e-3;
N=50;
t=[0:N]*Ts;
x=sin(100*pi*t)+0.4*sin(200*pi*t);
delta=0.2;
code1=dltpcm(x,delta);
xe=depcm(code1,delta);

kup=1.3;
kdown=0.8;
code2=dltpcm_adp(x,delta,kup,kdown);
xe2=depcm_adp(code2,delta,kup,kdown);

subplot(4,1,1);plot(t,x,'-o');
subplot(4,1,2);stairs(t,code1);axis([0 N*Ts -0.5 1.5]);
subplot(4,1,3);stairs(t,code2,'r');axis([0 N*Ts -0.5 1.5]);
subplot(4,1,4);stairs(t,xe);hold on;plot(t,x);hold on;stairs(t,xe2,'r');


% figure;
% subplot(3,1,1);plot(t,x,'-o');axis([0 N*Ts -2 2]);hold on;
% subplot(3,1,2);stairs(t,code2);axis([0 N*Ts -2 2]);
% subplot(3,1,3);stairs(t,xe2);hold on;plot(t,x);