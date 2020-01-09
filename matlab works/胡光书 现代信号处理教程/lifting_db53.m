
function [sn,dn]=db53_lifting(x)
%=====�ó������������С���任�����õ�С��Ϊ������������ʵ�ֵ� Daubechies 9/7С��=====
% ����һάС���ֽ�
% cn��dn�ֱ��Ƿֽ�õ��ĵ�Ƶ����(��òϵ��)�͸�Ƶ����(ϸ��ϵ��)
% xΪ���ֽ������

L=floor(length(x)/2);
s0=zeros(1,L); d0=zeros(1,L);

for i=1:L                          %������ż����ȡ
    se(i)=x(2*i-1);
    so(i)=x(2*i);
end

    dn=so-(se+[se(2:end) se(1)])/2;
    sn=se+(dn+[dn(end) dn(1:end-1)])/4;
    sn=sn*sqrt(2);

if L < length(x)/2           %����ԭ�����ĳ��Ȳ���
    dn = [dn,dn(L)];
end