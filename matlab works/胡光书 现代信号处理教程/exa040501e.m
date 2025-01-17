%---------------------------------------------------------------------------------------
%  exa040501e.m,  for  example 4.5.1 and fig 4.5.1(e)
%  核函数的等高线图
%----------------------------------------------------------------------------------------
clear;

sigma=1.5;
fs=1/128;
for t=1:128;
   for f=1:128;
      tt=(t-64)*(t-64);
      f1=(f-64)/128;
      ff=f1*f1;
   g(t,f)=exp(-tt*ff/sigma);
end
end
t=-63:64;
f=-0.5+fs:fs:.5;

subplot(211)
contour(t,f,g,1,'b');grid;
