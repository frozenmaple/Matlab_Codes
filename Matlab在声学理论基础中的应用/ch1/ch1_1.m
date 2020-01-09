clear; clc; close all;

A0=1;
omega0=40;
omega = 35;
t = 0:0.01:10;
x=A0*sin((omega0-omega)*t/2).*sin((omega0+omega)*t/2);
plot(t,x); grid on;
xlabel('x');ylabel('y');