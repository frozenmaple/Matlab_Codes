% ip_04_08.m Illustrative Problem 4.8
clear
echo on;
n=10;
tol=1e-6;
p1=0;
p2=1;
b=10*p2;
[a,y,dist]=lloydmax('normal',b,n,tol,p1,p2);
