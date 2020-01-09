%单自由度阻尼振动系统自由振动

clear; clc; close all;
t=0:0.01:30;
D=1;
M=1;
Rm = 3;
delta = Rm/(2*M);
omega0 = sqrt(D/M);
mu1 = -delta + sqrt( delta^2 - omega0^2 );
mu2 = -delta - sqrt( delta^2 - omega0^2 );
v0=0;
x0=0.5;
c1 = ( v0 - mu2*x0 )/(mu1-mu2);
c2 = ( v0 - mu1*x0 )/(mu2-mu1);
x = c1 * exp(mu1*t) + c2 * exp(mu2*t);
plot(t,x,'LineWidth',2);
axis([0 30 -1 1]);
xlabel('t');ylabel('x');
grid on;