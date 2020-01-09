close all;
x=0:0.05:6*pi;
y=0.6*sin(3*(x-0.5));
plot(x,y,'r','LineWidth',4);
axis ([-0.5,6*pi+0.5,-1.5,1.5])
figure;
x2=x-8;
y2=0.8*sign(x2);
plot(x2,y2,'r','LineWidth',4);
axis ([-3,6*pi+0.5,-1.5,1.5])