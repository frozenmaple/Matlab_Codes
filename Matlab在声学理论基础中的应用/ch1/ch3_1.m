%简谐均匀球面波场（质点运动）
 clear; clc; close all;
 f=50;
 omega=2*pi*f;
 c=340;
 rho=1.29;
 A=3e5;
 k=omega/c;
 x=-12:1:12;
 y=-12:1:12;
 %转二维图坐标
 [X,Y]=meshgrid(x,y);     
 %转极坐标
 R=sqrt(X.^2+Y.^2);     
 PHI=atan(Y./X);
 
 PHI(1:12,13:25)=abs(PHI(1:12,13:25))+pi/2;
 PHI(14:25,14:25)=abs(PHI(14:25,14:25))+pi;
 PHI(13:25,1:12)=abs(PHI(13:25,1:12))+pi*3/2;
 
 for t=0:0.001:1
     p=(1/(1i*omega*rho*c))*(1+1/(1i*k*c)).*(A./R).*exp(1i*(omega*t-k*R));
     xp=real(p);
     Rp=R+xp;
     Xp=Rp.*cos(PHI);
     Yp=Rp.*sin(PHI);
     plot(Xp,Yp,'b. ');
     axis([-11 11 -11 11]);
     xlabel('x');ylabel('z');
     pause(0.1);
 end
 
 