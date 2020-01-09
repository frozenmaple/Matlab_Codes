%单自由度阻尼振动系统受迫振动(动画展示)

clear; clc; close all;
A=1;
psi=0;
F0=10;
D=10;
Rm=0.3;
M=1;
omega=2;
delta=Rm/(2*M);
omega0=sqrt(D/M);
Omega = sqrt( omega0^2 - delta^2 );
Zm = Rm + i * ( M*omega - D/M);
Zm0 = abs(Zm);
phi = angle(Zm);
for t=0:0.01:40
    tp=0:0.01:t;
    xp=A*exp(-delta*tp).*cos(Omega*tp+psi)+(F0/(omega*Zm0)) * sin(omega*tp-phi);
    subplot(2,1,1);
    plot(tp,xp);
    xlabel('t'); ylabel('x');
    axis([0 40 -1.5 1.5]);
    subplot(2,1,2);
    x=A*exp(-delta*t).*cos(Omega*t+psi)+(F0/(omega*Zm0)) * sin(omega*t-phi);
    plot(x,0,'.','MarkerSize',30);
    xlabel('x');
    axis([-1.2 1.2 -1 1]);
    pause(0.005);
end