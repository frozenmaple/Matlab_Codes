clear;clc;close all;
ts=0.001;
fs=1/ts;
df=0.5;
N=fs/df;

t=[-2:ts:ts*(N-1)];

x=sinc(100*t).*cos(2*pi*200*t);
[X,x_new,df1] = fftseq(x,ts,df);
X1=X/fs;
f=[0:df1:df1*(length(x_new)-1)]-fs/2;
plot(t,x);
figure;
plot(f,fftshift(abs(X1)));


f0=200;
x_eq = loweq(x,ts,f0);
[X_eq,x_eq_new,df2] = fftseq(x_eq,ts,df);
X2=X_eq/fs;
f=[0:df2:df2*(length(x_eq_new)-1)]-fs/2;
figure;
plot(f,fftshift(abs(X2)));