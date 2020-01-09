% ip_4_07.m  added for spar
clear
p1=0;
p2=1;
delta=1;
n=11;
tol=0.01;
b=10*p2;
uq_mdpnt('normal',b,n,delta,tol,p1,p2)
