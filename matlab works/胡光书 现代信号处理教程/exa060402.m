%---------------------------------------------------------------------------------------
%  exa060402.m,   例 6.4.2 和 图 6.4.2  
%  利用半带滤波器及对应的高通滤波器对一个含有噪声的信号进行分解。
%  半带滤波器h0来自程序exa070501
%----------------------------------------------------------------------------------------
clear;

load h0;
h1=qmf(h0,1)

NN=1000;w1=pi/4;
u=0.8*rand(1,NN);
for i=1:NN
   x(i)=sin(w1*i)+u(i);
end
subplot(311)
plot(1:150,x(1:150))
title(' test signal x(n)')

x10=filter(h0,1,x);
x11=filter(h1,1,x);
subplot(312)
plot(1:150,x10(101:250))
title('lowpass signal v0(n)')
subplot(313)
plot(1:150,x11(101:250))
title('highpass signal v1(n)')

