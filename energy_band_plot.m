%to plot energy band structure in book P173

a=1.5;
kx = -pi/a:0.01:pi/a;

y1=kx.^2;
y2=(kx + 2*pi/a).^2;
y3=(kx - 2*pi/a).^2;
y4=kx.^2+(2*pi/a)^2;
y5=(kx + 2*pi/a).^2+(2*pi/a)^2;
y6=(kx - 2*pi/a).^2+(2*pi/a)^2;
y7=kx.^2+2*(2*pi/a)^2;

plot(kx,y1,kx,y2,kx,y3,kx,y4,kx,y5,kx,y6,kx,y7)
