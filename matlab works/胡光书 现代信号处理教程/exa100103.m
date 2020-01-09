%--------------------------------------------------------------------------
%-- exa100103 ,用于绘制图10.1.3的（b）和（c）
%--------------------------------------------------------------------------
clear;

%------plot the signal----------
load myfigure;
N=13;
subplot(2,1,1);
axis([1,13,-0.5,0.5]);

%----------- plot the NO.1 -----
for i=1:N-1
   yy_t=s(1,10*i-9)-s(1,10*i-4);
   yy=0:yy_t/100:yy_t;
   yy_x=i*ones(size(yy));
   plot(yy_x,yy,'-k');
   hold on;
   plot(i:0.1:i+0.5,yy_t*ones(size(i:0.1:i+0.5)),'-k');
   yy_2y=-abs(yy_t):(2*abs(yy_t/10)):abs(yy_t);
   yy_2x=(i+0.5)*ones(size(yy_2y));
   plot(yy_2x,yy_2y,'-k');
   plot(i+0.5:0.001:i+1,(-1)*(yy_t)*ones(size(i+0.5:0.001:i+1)),'-k');
   if i==N-1
      break;
   end
   yy_x=(i+1)*ones(size(yy));
   plot(yy_x,-1*yy,'-k');
end
%----------- plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%----------- plot the Y axis!
xx_yy=-1:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
axis([1,13,-1,1]);
axis('off');

%------------ plot the NO.2-----
subplot(2,1,2);
for i=1:N-1
   hold on;
   stem(i,s(1,10*i-9)-s(1,10*i-4),'k');
end
axis([1,13,-1,1]);
%----------- plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%----------- plot the Y axis!
xx_yy=-1:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
axis('off');

