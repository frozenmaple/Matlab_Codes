function [inter]=P_gama(interval,lev,sr);
T=length(interval);
%�ú�����һ���������PgamaͶӰ����������������
if T==2
    inter=interval;
else
    t=linspace(0,(T-1)/sr,T);
    para=(([1,1;exp(2^(-lev)*t(T)),exp(-2^(-lev)*t(T))])\[interval(1),interval(T)]')';
    alpha=para(1);
    beta=para(2);
    inter=alpha.*exp(2^(-lev).*t)+beta.*exp(-2^(-lev).*t);
end