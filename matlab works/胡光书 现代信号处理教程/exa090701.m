% -------------------------------------------------------------------
% exa090702.m, for example 9.7.1 and fig 9.7.1
% ����С���任��noissin ��MATLAB�д������������źš�
% �����������������С���任�ڵ����߶��µ�С���任�����
% �����г߶ȷֱ���   a=2, �� a=128
%--------------------------------------------------------------------
clear;

 load noissin;
 s=noissin;
 ls=length(s)
 subplot(3,1,1)
 plot(s);grid
 ylabel(' signal "noissin"')
 scales=2;
 c=cwt(s,scales,'db5');
 subplot(3,1,2)
 plot(c);grid
 ylabel(' a=2')

 scales=128;
 c=cwt(s,scales,'db5');%size(c)
 subplot(3,1,3)
 plot(c);grid
 ylabel(' a=128')



