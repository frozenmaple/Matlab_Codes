function [inter]=P_gama(interval,lev,sr);
T=length(interval);
%该函数对一个区间进行Pgama投影，返回修正的区间
if T==2
    inter=interval;
else
    t=linspace(0,(T-1)/sr,T);
    para=(([1,1;exp(2^(-lev)*t(T)),exp(-2^(-lev)*t(T))])\[interval(1),interval(T)]')';
    alpha=para(1);
    beta=para(2);
    inter=alpha.*exp(2^(-lev).*t)+beta.*exp(-2^(-lev).*t);
end