%------------------------------------------------------------------------
% exa090203.m,   for figure 9.2.3
%------------------------------------------------------------------------

T=8;
w0=2;
%---------NO.1---------
t=-2*pi:0.01:2*pi;
g=exp(-t.^2/T).*cos(w0*t);
gg=exp(-t.^2/T);
subplot(2,2,1);
plot(t,g,'-k');
hold on;
plot(t,gg,'--k');
%-------plot the X axis
zer_x=-10:1:10;
zer_xx=zeros(size(zer_x));
plot(zer_x,zer_xx,'-k');
text(10,-0.1,'t');
%------plot the Y axis
zer_yy=-1:0.5:1.5;
zer_y=0*ones(size(zer_yy));
plot(zer_y,zer_yy,'-k');
axis([-10,10,-1,1.5]);
axis('off');

%-------NO.2------
w=-2*pi:0.01:2*pi;
G=sqrt(pi/T)*exp(-(w-w0).^2/(4/T));
subplot(2,2,2);
plot(w,G,'-k');
hold on;
%--------plot the X axis
zer_x=0:1:4;
zer_xx=zeros(size(zer_x));
plot(zer_x,zer_xx,'-k');
%--------plot the Y axis
zer_yy=0:0.5:1;
zer_y=0*ones(size(zer_yy));
plot(zer_y,zer_yy,'-k');
%--------plot the axis!
zer_ww=0:0.5:max(G);
zer_w=w0*ones(size(zer_ww));
plot(zer_w,zer_ww,'--k');
axis([0,4,0,1]);
axis('off');

%---------NO.3---------
t=-2*pi:0.01:2*pi;
g=exp(-t.^2/T).*cos(2*w0*t);
gg=exp(-t.^2/T);
subplot(2,2,3);
plot(t,g,'-k');
hold on;
plot(t,gg,'--k');
%--------plot the X axis
zer_x=-10:1:10;
zer_xx=zeros(size(zer_x));
plot(zer_x,zer_xx,'-k');
text(10,-0.1,'t');
%--------plot the Y axis
zer_yy=-1:0.5:1.5;
zer_y=0*ones(size(zer_yy));
plot(zer_y,zer_yy,'-k');
axis([-10,10,-1,1.5]);
axis('off');

%-------NO.4------
w=-2*pi:0.01:2*pi;
G4=sqrt(pi/T)*exp(-(w-2*w0).^2/(4/T));
subplot(2,2,4);
plot(w,G4,'-k');
hold on;
%---------plot the X axis!
zer_x=0:1:6;
zer_xx=zeros(size(zer_x));
plot(zer_x,zer_xx,'-k');
%---------plot the Y axis!
zer_yy=0:0.5:1;
zer_y=0*ones(size(zer_yy));
plot(zer_y,zer_yy,'-k');
%---------plot the axis!
zer_ww=0:0.5:max(G4);
zer_w=2*w0*ones(size(zer_ww));
plot(zer_w,zer_ww,'--k');
axis([0,6,0,1]);
axis('off');

