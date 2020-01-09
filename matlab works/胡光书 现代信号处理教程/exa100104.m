%--------------------------------------------------------------------------
%-- exa100104 ,用于绘制图10.1.4的（b）和（c）
%--------------------------------------------------------------------------
clear;

%------ plot the signal----------
load myfigure;
N=13;
figure(4);
subplot(2,1,1);

%-----------plot the NO.3-----
for i=1:2:N-1
   yy_t=s(1,10*i-9)-s(1,10*i+1);
   yy=0:yy_t/100:yy_t;
   yy_x=i*ones(size(yy));
   plot(yy_x,yy,'-k');
   hold on;
   plot(i:0.1:i+1,yy_t*ones(size(i:0.1:i+1)),'-k');
   yy_2y=-abs(yy_t):(2*abs(yy_t/10)):abs(yy_t);
   yy_2x=(i+1)*ones(size(yy_2y));
   plot(yy_2x,yy_2y,'-k');
   plot(i+1:0.001:i+2,(-1)*(yy_t)*ones(size(i+1:0.001:i+2)),'-k');
   if i==N-1|i==N-2
      break;
   end
   yy_x=(i+2)*ones(size(yy));
   plot(yy_x,-1*yy,'-k');
end
%-------------- plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%------------- plot the Y axis!
xx_yy=-1:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
axis([1,13,-1,1]);
axis('off');

%------------ plot the NO.4-----
subplot(2,1,2);
stem(1,s(1,1)-s(1,11),'k');
hold on;
for i=1:2:N-1
   hold on;
   stem(i,s(1,10*i-9)-s(1,10*i+1),'k');
end
axis([1,13,-1,1]);
%------------ plot the X axis!
xx_t=0:13;
xx_ty=zeros(size(xx_t));
hold on;
plot(xx_t,xx_ty,'-k');
%------------ plot the Y axis!
xx_yy=-1:4;
xx_xx=ones(size(xx_yy));
plot(xx_xx,xx_yy,'-k');
axis('off');
