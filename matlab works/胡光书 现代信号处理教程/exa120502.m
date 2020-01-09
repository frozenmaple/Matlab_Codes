%--------------------------------------------------------------------------
% exa120502.m,   for example 12.5.2 and fig12.5.4
%--------------------------------------------------------------------------
clear;

[wp,x]=wpfun('db5',8);

figure(1)
for i=1:4
    w=wp(i,:);
   subplot(3,2,i);plot(x,w);grid on;
   ylabel(['W',num2str(i-1)]);
   end
   
figure(2)
for i=5:8
    w=wp(i,:);
   subplot(3,2,i-4);plot(x,w);grid on;
   ylabel(['W',num2str(i-1)]);
   end
