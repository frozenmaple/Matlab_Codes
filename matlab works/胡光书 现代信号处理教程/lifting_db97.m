
function [cn,dn]=lifting_db97(x)
%=====�ó������������С���任�����õ�С��Ϊ������������ʵ�ֵ� Daubechies 9/7С��=====
% ����һάС���ֽ�
% cn��dn�ֱ��Ƿֽ�õ��ĵ�Ƶ����(��òϵ��)�͸�Ƶ����(ϸ��ϵ��)
% xΪ���ֽ������

L=floor(length(x)/2);
s0=zeros(1,L); d0=zeros(1,L);
alpha = -1.586134342; beta = -0.05298011854; gamma = 0.8829110762; delta = 0.4435068522;
K = 1.149604398;                   %�趨����ֵ

for i=1:L                          %������ż����ȡ
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

cn=K*s0; dn=d0/K;            %��� cn �� dn

if L < length(x)/2           %����ԭ�����ĳ��Ȳ���
    dn = [dn,dn(L)];
end