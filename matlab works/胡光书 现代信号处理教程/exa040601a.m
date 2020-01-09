%---------------------------------------------------------------------------------------
%  exa040601a.m,  for  example 4.6.1 and fig 4.6.1(a)
%  BJ分布在四个域内的形状;
%
%----------------------------------------------------------------------------------------
clear;
n=256;
width=6*pi;
omega=width/n;
for t=1:n;
   for f=1:n;
      tt=(t-n/2)*omega;
      ff=(f-n/2)*omega;
      tf=tt*ff;
      if tf==0
         g(t,f)=1;
      else
         g(t,f)=sin(tf)/tf;
         end
   end
end
t=-width/2+omega:omega:width/2;
f=-width/2+omega:omega:width/2;

subplot(221)
surfl(t,f,g,[-37,5,60]);

