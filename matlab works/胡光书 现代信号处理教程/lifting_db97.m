
function [cn,dn]=lifting_db97(x)
%=====该程序对向量进行小波变换，所用的小波为利用提升方案实现的 Daubechies 9/7小波=====
% 这是一维小波分解
% cn和dn分别是分解得到的低频向量(概貌系数)和高频向量(细节系数)
% x为待分解的向量

L=floor(length(x)/2);
s0=zeros(1,L); d0=zeros(1,L);
alpha = -1.586134342; beta = -0.05298011854; gamma = 0.8829110762; delta = 0.4435068522;
K = 1.149604398;                   %设定参数值

for i=1:L                          %进行奇偶二抽取
    s0(i)=x(2*i-1);
    d0(i)=x(2*i);
end

s1=s0(2:L); 
s1=[s1,s0(L)]; 
d0=d0+alpha*(s0+s1);
d1=d0(1:L-1); 
d1=[d0(1),d1];
s0=s0+beta*(d0+d1);
s1=s0(2:L);
s1=[s1,s0(L)];
d0=d0+gamma*(s0+s1);
d1=d0(1:L-1);
d1=[d0(1),d1];
s0=s0+delta*(d0+d1);

cn=K*s0; dn=d0/K;            %求出 cn 和 dn

if L < length(x)/2           %保持原向量的长度不变
    dn = [dn,dn(L)];
end