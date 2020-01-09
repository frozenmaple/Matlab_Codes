function [B1,P1]=resolve(B)
l=length(B);
A=zeros(l,1);
A(1)=1;
A=A';

figure(7);
zplane(B,A);
title('the zeros and poles before resolve') 

[Z,P,K]=tf2zp(B,A);
Z1=sort(Z)
ll=length(Z1)/2;
ZZ=Z1(1:ll);
temp=1;
for m=1:ll
    temp=(-ZZ(m))*temp;
end
if imag(temp)<0.0001
   temp=real(temp);
end
KK=sqrt(K/temp);
l2=length(ZZ);
PP=zeros(l2,1);
[B1,P1]=zp2tf(ZZ,PP,KK);
figure(8)
zplane(B1,P1);
title('the zeros and poles after resolve') 
%figure(9)
%freqz(B1,1);
%title('filter h0')