
function [sn,dn]=db53_lifting(x)
%=====该程序对向量进行小波变换，所用的小波为利用提升方案实现的 Daubechies 9/7小波=====
% 这是一维小波分解
% cn和dn分别是分解得到的低频向量(概貌系数)和高频向量(细节系数)
% x为待分解的向量

L=floor(length(x)/2);
s0=zeros(1,L); d0=zeros(1,L);

for i=1:L                          %进行奇偶二抽取
    se(i)=x(2*i-1);
    so(i)=x(2*i);
end

    dn=so-(se+[se(2:end) se(1)])/2;
    sn=se+(dn+[dn(end) dn(1:end-1)])/4;
    sn=sn*sqrt(2);

if L < length(x)/2           %保持原向量的长度不变
    dn = [dn,dn(L)];
end