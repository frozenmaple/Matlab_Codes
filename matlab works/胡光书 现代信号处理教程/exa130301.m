%--------------------------------------------------------------------------
% exa130301.m  例13.3.1: 利用小波变换模极大重建原信号
%--------------------------------------------------------------------------
close all;
points=1024;        level=6;    sr=360;   num_inter=6;   wf='db3';
%所处理数据的长度 分解的级数   抽样率     迭代次数      小波名称

offset=0;
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(wf);

%计算小波分解系数和模极大序列
[signal,swa,swd,ddw,wpeak]=wave_peak(points,level,Lo_D,Hi_D,Lo_R,Hi_R,offset);
% signal:  原始信号;       swa:小波概貌;  swd:小波细节;
% ddw:     局部极大位置; wpeak:小波变换的局部极大序列]

pswa=swa(level,:);  % pswa: 为待重建的信号
wframe=(wpeak~=0);
%迭代初始化
w0=zeros(1,points);
[a,d]=swt(w0,level,Lo_D,Hi_D);
w2=d;  % w2为待重建小波
    for j=1:num_inter
       w2=Py_Pgama(d,wpeak,wframe,1,sr);   % 先进行Py投影和 Pgama投影
       w0=iswt(pswa,w2,Lo_R,Hi_R);         % 再进行Pv投影
       [a,d]=swt(w0,level,Lo_D,Hi_D);      % Pv
    end
     pswa=iswt(swa(level,:),w2,Lo_R,Hi_R); % 计算重建信号
     
% 原信号和由模极大重建信号的比较
figure,
subplot(211)
plot(pswa(1:points)); 
subplot(212)
plot(signal(1:points),'r');

%分别计算重建小波以及原信号的信噪比
werr=w2-swd;
% 原信号的小波变换（swd)和重建后的小波变换（w2）的比较
figure,
for m=1:level
    wsnr(m)=20*log10(norm(swd(m,:))/norm(werr(m,:)))
    subplot(level+1,1,m);
    plot(swd(m,:)),hold on,
    plot(w2(m,:),'r');grid on;ylabel(strcat('j=',num2str(m))),axis tight;
end
err=pswa(1:points)-signal(1:points);
snr=20*log10(norm(signal)/norm(err))