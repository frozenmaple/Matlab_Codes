%ºÚ–≥∆Ω√Ê≤®≥°
 clear; clc; close all;
 
 f=50;
 omega = 2*pi*f;
 c=340;
 k=omega/c;
 x=-2:1:32;
 for t=0:0.001:1
     p0=cos(omega*t-k*x);
     xp=x-p0;
     zp=zeros(size(x));
     subplot(2,1,1);
     for z=-10:1:10
         plot(xp,zp+z,'.');
         hold on;
     end
     for z=-10:1:10
         plot(xp(10),zp(10)+z,'r. ','MarkerSize',20);
         hold on;
     end
     hold off;
     axis([0 30 -11 11]);
     xlabel('x');ylabel('y');
     subplot(2,1,2);
     plot(0:0.1:30,cos(omega*t-k*(2:0.1:32)));
     xlabel('x');ylabel('p0');
     pause(0.1);
 end