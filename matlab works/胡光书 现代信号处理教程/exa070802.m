%-----------------------------------------------------------------------------------
% exa070802.m    for example 7.8.2 ,fig7.8.1 and fig 7.8.2
% to explain how to design a biorthogonal FB by spectral factorisation.;
% p.mat: From program exa060301.m
%-----------------------------------------------------------------------------------
clear all;
load p;

N0=512;Fs=1;
a=1;
A=zeros(length(p),1);
A(1)=1;
[Z,P,K]=tf2zp(p,A')

%--------------------------------------------------------------------------------
% Next loop is for MATLAB 5.3
%   for i=9:18
%       Z(i)=-1;
%   end
%   z0=[Z(1),Z(2),Z(7),Z(8),Z(9),Z(10),Z(11),Z(12),Z(13)]
%   z1=[Z(3),Z(4),Z(5),Z(6),Z(14),Z(15),Z(16),Z(17),Z(18)]
%--------------------------------------------------------------------------------

for i=5:14
    Z(i)=-1;
end
 
z0=[Z(1),Z(2),Z(5),Z(6),Z(7),Z(8),Z(9),Z(17),Z(18)]
z1=[Z(3),Z(4),Z(10),Z(11),Z(12),Z(13),Z(14),Z(15),Z(16)]
temp0=1;
temp1=1;
for i=1:9
    temp0=(-z0(i))*temp0;
    temp1=(-z1(i))*temp1;
end
if imag(temp0)<0.0001
   temp0=real(temp0);
end
if imag(temp1)<0.0001
   temp1=real(temp1);
end
K0=sqrt(K/temp0);
K1=sqrt(K/temp1);


l0=length(z0);
l1=length(z1);
P0=zeros(l0,1);
P1=zeros(l1,1);
[h0,P0]=zp2tf(z0',P0,K0);
[h11,P1]=zp2tf(z1',P1,K1);
h1=qmf(h11,1);


figure(1)
subplot(221)
stem(h0);grid;
subplot(222)
zplane(h0,1);grid;
subplot(223)
stem(h1);grid;
subplot(224)
zplane(h1,1);grid;

figure(2)
[H0,w]= freqz(h0,a,N0,Fs);
[H1,w]= freqz(h1,a,N0,Fs);
absH0=abs(H0);
absH1=abs(H1);
subplot(224)
plot(w,absH0,'k-',w,absH1,'b-');grid;

