function [t,omg,FT,IFT] = prefourier(Trg,N,OMGrg,K)
%��;��
%��������þ������ʵ�ָ���Ҷ�任ǰ��׼������
%���������
%ʱ����ֹ��Χ��ʱ�����������Ƶ����ֹ��Χ��Ƶ���������
%����ֵ��
%ʱ���Ƶ������㡢����Ҷ�任����任����

T = Trg(2)-Trg(1);                                                 %ʱ��Χ
t = linspace(Trg(1),Trg(2)-T/N,N)';                         %���ɳ���ʱ���
OMG = OMGrg(2) - OMGrg(1);                            %Ƶ��Χ
omg = linspace(OMGrg(1),OMGrg(2)-OMG/K,K)'; %���ɳ���Ƶ�ʵ�
FT = T/N*exp(-j*kron(omg,t.'));
IFT=OMG/2/pi/K*exp(j*kron(t,omg.'));