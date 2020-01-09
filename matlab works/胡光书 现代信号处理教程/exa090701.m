% -------------------------------------------------------------------
% exa090702.m, for example 9.7.1 and fig 9.7.1
% 连续小波变换。noissin 是MATLAB中带噪声的正弦信号。
% 本程序给出的是连续小波变换在单个尺度下的小波变换结果。
% 程序中尺度分别是   a=2, 和 a=128
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



