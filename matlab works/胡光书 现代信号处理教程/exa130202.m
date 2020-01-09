% -----------------------------------------------------------------------－－
%   exa130202.m,   例13.2.2
%  求冲激函数、阶跃函数及三角函数的小波变换、模极大线并求它们的李氏指数
%  注：在该程序中，用到了子程序 RWT.m，
%      该程序请读者在如下的网站上下载:
%                      http://www-stat.stanford.edu/~wavelab/
%      因为该网站上的小波分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%------------------------------------------------------------------------
close all;

nvoice = 16;
%   nvoice表示每2倍s之间被分为多少点

wavelet = 'Sombrero'; 
% 选择小波：可选择的小波包括： 'Gauss','DerGauss','Morlet'and'Sombrero'(mexh)
    N = 64*8;
    n = N;
    oct = 5;
    scale = 8;
   	noctave = floor(log2(n))-oct;
	nscale  = nvoice .* noctave;
    ytix   = linspace(2+(oct-floor(log2(scale))),log2(N)+2-floor(log2(scale)),nscale);
%  ytix 从imageRWT函数得到 理论上应等于log2(s)
%  ytix = linspace(log2(scale)-noctave,log2(scale),nscale);
    xtix   = linspace(0,N,N);
for count=1:3
   if count==1
        sig = zeros(1,N);sig(N/2) =sig(N/2) +1;% 冲激函数
        ti='冲激函数';
    elseif count==2
        sig = zeros(1,N);sig(N/4:3*N/4) = sig(N/4:3*N/4)+1; % 矩形窗
        ti='矩形窗';
    else
        sig(N/4:N/2) = linspace(0,1,N/4+1);
        sig(N/2:3*N/4) = linspace(1,0,N/4+1); % 三角窗
        ti='三角窗';
    end
    sig = sig+1e-8*randn(1,N);
    rwt = RWT(sig,nvoice,wavelet,oct,scale);
    [n,nscale] = size(rwt);
   
    subplot(4,3,count); % 显示信号波形
    plot(sig);grid;title(ti);
    axis([1 N min(sig)-.1 max(sig)+.1]);
    subplot(4,3,3+count); % 显示小波变换结果
    imagesc(xtix,ytix,flipud(rwt'));colormap(gray);
     maxmap = MM_RWT(rwt);
%  maxmap就是与rwt相同大小的矩阵，但在maxima处为1，其它处为0

   [skellist,skelptr,skellen] = SkelMap(maxmap);
% skellist 依次记录了每条"山脊"点坐标对(j,i):[j1,i1,j2,i2,...]。
% 则所有最大点的坐标都存在里面
% skelptr 为指向skellist的"指针"skelptr第n个元素是指第n条"山脊"的起点在skellist中的位置。
% 如skelptr(2)=65，skelptr(3)=129，则skellist(65:128)就是第2条"山脊"上各点的坐标对。
% skellen(n)就是第n条"山脊"的在skellist中的长度。
 
    block=rwt';
%   找出最大值及其位置
    [maxvalue,maxpos]=max(block,[],2);
%   找出最小值及其位置
    [minvalue,minpos]=min(block,[],2);
    subplot(4,3,6+count); % 绘制最大最小线
    PlotSkelMap(n,nscale,skellist,skelptr(:),skellen(:),'','b',[],nvoice,min(ytix),noctave);grid;
    ylabel('')
%    ylabel('log2(s)');
    subplot(4,3,9+count);% 估计斜率
%    plot(ytix,log2(abs(flipud(minvalue)))-ytix'/2,'b-');hold on;
%   蓝色实线为最小线，  -ytix'/2这项相当于除以sqrt(s)
%   
    plot(ytix,log2(abs(flipud(minvalue))),'b-');hold on;

%      在log2()之内./sqrt(2.^ytix')与在log2()之外-ytix'/2等效
    plot(ytix,log2(abs(flipud(maxvalue))),'r--');
    grid on;
    hold off;
 end
