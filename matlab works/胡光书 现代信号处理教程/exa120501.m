%--------------------------------------------------------------------------
% exa120501.m,   for example 12.5.1 and fig12.5.3
%--------------------------------------------------------------------------
clear;

[wp,x]=wpfun('db1',8);
figure(1)
for i=1:2
    w=wp(i,:);
   subplot(4,2,i);plot(2*x,w);grid on;
   ylabel(['W',num2str(i-1)]);
   end
   
figure(2)
for i=1:4
    w=wp(i,:);
   subplot(4,2,i);plot(4*x,w);grid on;
   ylabel(['W',num2str(i-1)]);
   end
   
figure(3)
for i=1:8
    w=wp(i,:);
   subplot(4,2,i);plot(8*x,w);grid on;
   ylabel(['W',num2str(i-1)]);
   end
