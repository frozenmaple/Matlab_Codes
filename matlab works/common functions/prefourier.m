function [t,omg,FT,IFT] = prefourier(Trg,N,OMGrg,K)
%用途：
%用于完成用矩阵左乘实现傅里叶变换前的准备工作
%输入参数：
%时域起止范围、时域抽样点数、频域起止范围、频域抽样点数
%返回值：
%时域和频域抽样点、傅立叶变换和逆变换矩阵

T = Trg(2)-Trg(1);                                                 %时域范围
t = linspace(Trg(1),Trg(2)-T/N,N)';                         %生成抽样时间点
OMG = OMGrg(2) - OMGrg(1);                            %频域范围
omg = linspace(OMGrg(1),OMGrg(2)-OMG/K,K)'; %生成抽样频率点
FT = T/N*exp(-j*kron(omg,t.'));
IFT=OMG/2/pi/K*exp(j*kron(t,omg.'));