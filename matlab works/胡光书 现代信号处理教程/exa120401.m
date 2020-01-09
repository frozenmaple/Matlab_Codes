%--------------------------------------------------------------------------
% exa120401.m,   for fig12.4.1
%--------------------------------------------------------------------------
clear;

n1=[];
n2=[];
n3=[];
delt=0.1;

for t=0:delt:4
   if t>=0 & t<1
      n1=[n1 1];
      n2=[n2 t];
      n3=[n3 t.^2./2];
   else if t>=1 & t<2
         n2=[n2 2-t];
         n3=[n3 3/4-(t-3/2).^2];
      else if t>=2 & t<3
            n2=[n2 0];
            n3=[n3 1/2*(t-3).^2];
         else
            n2=[n2 0];
            n3=[n3 0];
         end
      end
   end
end

figure(1);
tt=0:delt:4;
y0=0:0.1:2;
N=size(y0,2);
t0=zeros(1,N);

n1=[n1 1];
N1=size(1:delt:4,2);
n11=zeros(1,N1);
n1=[n1 n11];
tt1=[0:delt:1,1:delt:4];


subplot(3,1,1);
plot(tt1,n1);
hold on;
plot(t0,y0);

subplot(3,1,2);
plot(tt,n2);
hold on;
plot(t0,y0);

subplot(3,1,3);
plot(tt,n3);
hold on;
plot(t0,y0);
