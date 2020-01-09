clear; clc; close all;

A0=1;
omega0=40;
omega = 35;
for t = 0:0.01:10
    tp = 0:0.01:t;
    xp = A0*sin((omega0-omega)*tp/2).*sin((omega0+omega)*tp/2);
    subplot(2,1,1);
    plot(tp,xp)
    xlabel('t');ylabel('x');
    axis([0 10 -1.5 1.5]);
    subplot(2,1,2);
    x=A0*sin((omega0-omega)*t/2).*sin((omega0+omega)*t/2);
    plot(x,0,'.','MarkerSize',30);
    xlabel('x');
    axis([-1 1 -1 1]);
    pause(0.05);
end