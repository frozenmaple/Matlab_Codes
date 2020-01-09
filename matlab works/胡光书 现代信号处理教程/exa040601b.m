%---------------------------------------------------------------------------------------
%  exa040601b.m,  for  example 4.6.1 and fig 4.6.1(b)
%  BJ分布在四个域内的形状;
%
%----------------------------------------------------------------------------------------
clear;

n=128;
width=4*pi;
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
g=fft2(g);
g=abs(g);
g=change(g);
g=rot90(g);
g=change(g);
t=-width/2+omega:omega:width/2;
f=-width/2+omega:omega:width/2;

colormap([0 1 1])
subplot(221)
surf(t,f,g);

