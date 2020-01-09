%--------------------------------------------------------------------------
%-- exa100101 ,用于绘制图10.1.1的（b）和（c）
%--------------------------------------------------------------------------
clear;

%------plot the signal----------
ss=[1.5,2.5,3.1,3.5,3.6,3,2.3,2.5,2.9,3.3,3.7,3.4,2.8];
N=size(ss,2);
tt=0:1:N-1;
t=1:0.1:N;
s=spline(tt,ss,t);
%-------------save t,s
save myfigure t s;
subplot(2,1,1);
plot(t,s,'-k');
axis([1,13,0,4]);

%-----------plot the NO.1-----
hold on;
for i=1:N-1
   yy_t=s(1,10*i-9);
   yy=0:(yy_t/10):yy_t;
   yy_x=i*ones(size(yy));
   plot(yy_x,yy,'-k');
   plot(i:0.1:i+1,s(1,10*i-9)*ones(size(i:0.1:i+1)),'-k');
   if i==N-1
      break;
   else
      yy_x=(i+1)*ones(size(yy));
      plot(yy_x,yy,'-k');
   end
end
%----------------- plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%----------------- plot the Y axis!
xx_yy=0:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
%axis('off');

%------------ plot the NO.2-----
subplot(2,1,2);
for i=1:N-1
   hold on;
   stem(i,s(1,10*i-9),'-k');
end
axis([1,13,0,4]);
%------------- plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%-------------- plot the Y axis!
xx_yy=0:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
%axis('off');
