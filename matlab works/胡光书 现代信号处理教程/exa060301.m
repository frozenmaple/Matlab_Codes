%-----------------------------------------------------------------------------------
% exa060301.m    for example 6.3.1 and fig6.3.1
% To explain how to design a Lagrang half-band filter;
%-----------------------------------------------------------------------------------
clear;

sum=4.5*4.5*3.5*3.5*2.5*2.5*1.5*1.5*0.5*0.5;
d1=factorial(4)*factorial(5)*1;
d2=factorial(3)*factorial(6)*3;
d3=factorial(2)*factorial(7)*5;
d4=factorial(1)*factorial(8)*7;
d5=factorial(0)*factorial(9)*9;
h(1)=sum/d1;
h(3)=-sum/d2;
h(5)=sum/d3;
h(7)=-sum/d4;
h(9)=sum/d5;
p=[h(9),0,h(7),0,h(5),0,h(3),0,h(1),0.5,h(1),0,h(3),0,h(5),0,h(7),0,h(9)];

figure(1)
subplot(221)
zplane(p,1)

[P0,w]= freqz(p,1,512,1);
subplot(222)
plot(w,abs(P0));grid;

figure(2)
stem(p);grid;

save p.mat p;
