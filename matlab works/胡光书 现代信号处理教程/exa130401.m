%-------------------------------------------------------------------------
% exa130401
% 本程序先生成一个“Blocks”信号，然后加上高斯白噪声，再用'db3'小波进行分解，
% 以说明信号和噪声在各个尺度上的表现。
% 注：在该程序中，用到了子程序 GWNoisy.m，
%      该程序请读者在如下的网站上下载:
%                      http://www-stat.stanford.edu/~wavelab/
%      因为该网站上的小波分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%--------------------------------------------------------------------------
clear all;

% 生成“Blocks”信号
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
%title(' 原信号');  
grid on;

% 加上白噪声
sigma=0.1;
sig= GWNoisy(FBlock',sigma);
subplot(323)
plot(sig)
%title(' 带噪信号');  
grid on;

% 小波分解
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





