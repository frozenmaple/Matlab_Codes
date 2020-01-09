%--------------------------------------------------------------------------
% exa120503.m,   for example 12.5.3 and fig12.5.7
%--------------------------------------------------------------------------
clear;

load noisdopp;
x=noisdopp(1:1000);
t=wpdec(x,3,'db5','shannon');

figure(1)
subplot(221);plot(x);
ylabel(' signal x(t)')
cfs10=wpcoef(t,[1,0]);
cfs11=wpcoef(t,[1,1]);
subplot(223);plot(cfs10);
ylabel(' d1,0')
subplot(224);plot(cfs11);
ylabel(' d1,1')
cfs20=wpcoef(t,[2,0]);
cfs21=wpcoef(t,[2,1]);
cfs22=wpcoef(t,[2,2]);
cfs23=wpcoef(t,[2,3]);

figure(2)
subplot(221);plot(cfs20);
ylabel(' d2,0')
subplot(222);plot(cfs21);
ylabel(' d2,1')
subplot(223);plot(cfs22);
ylabel(' d2,2')
subplot(224);plot(cfs23);
ylabel(' d2,3')

cfs30=wpcoef(t,[3,0]);
cfs31=wpcoef(t,[3,1]);
cfs32=wpcoef(t,[3,2]);
cfs33=wpcoef(t,[3,3]);
cfs34=wpcoef(t,[3,4]);
cfs35=wpcoef(t,[3,5]);
cfs36=wpcoef(t,[3,6]);
cfs37=wpcoef(t,[3,7]);

figure(3)
subplot(221);plot(cfs30);
ylabel(' d3,0')
subplot(222);plot(cfs31);
ylabel(' d3,1')
subplot(223);plot(cfs32);
ylabel(' d3,2')
subplot(224);plot(cfs33);
ylabel(' d3,3')

figure(4)
subplot(221);plot(cfs34);
ylabel(' d3,4')
subplot(222);plot(cfs35);
ylabel(' d3,5')
subplot(223);plot(cfs36);
ylabel(' d3,6')
subplot(224);plot(cfs37);
ylabel(' d3,7')

