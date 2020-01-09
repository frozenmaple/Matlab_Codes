%-------------------------------------------------------------------------
% exa130401
% ������������һ����Blocks���źţ�Ȼ����ϸ�˹������������'db3'С�����зֽ⣬
% ��˵���źź������ڸ����߶��ϵı��֡�
% ע���ڸó����У��õ����ӳ��� GWNoisy.m��
%      �ó�������������µ���վ������:
%                      http://www-stat.stanford.edu/~wavelab/
%      ��Ϊ����վ�ϵ�С�����������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%--------------------------------------------------------------------------
clear all;

% ���ɡ�Blocks���ź�
M = 1/1024;
N = 1/M;
t =0:M:1-1/1024;
TPoint = [0.1,0.13,0.15,0.23,0.25,0.40,0.44,0.65,0.76,0.78,0.81];
h = [4,-5,3,-4,5,-4.2,2.1,4.3,-3.1,2.1,-4.2];
[aaa,TSize] = size(TPoint);
FBlock = zeros(N,1);
for j = 1:N
    for i = 1:TSize
        if (t(j) - TPoint(i))> 0
            sgnt = 1;
        elseif (t(j) - TPoint(i))< 0
            sgnt  = -1;
        else
            sgnt =0;
        end
        FBlock(j) = FBlock(j) +h(i)*(1+sgnt)/2;
    end
end
%sig=FBlock';
subplot(321)
plot(FBlock)
%title(' ԭ�ź�');  
grid on;

% ���ϰ�����
sigma=0.1;
sig= GWNoisy(FBlock',sigma);
subplot(323)
plot(sig)
%title(' �����ź�');  
grid on;

% С���ֽ�
[c,l]=wavedec(sig,2,'db3');   
ca2=appcoef(c,l,'db3',2);
cd2=detcoef(c,l,2);
cd1=detcoef(c,l,1);
subplot(322)
plot(cd1)
subplot(324)
plot(cd2)
subplot(326)
plot(ca2)

dl=length(cd2)+length(cd1);
c1=[ca2,zeros(1,dl)];
y=waverec(c1,l,'db3');
subplot(325)
plot(y)





