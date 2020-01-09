%--------------------------------------------------------------------------
% exa130203.m  例13.2.3: 利用小波变换检测R波,并给出模极大曲线
%--------------------------------------------------------------------------
clear all;

ecgdata=load('ecg.txt');
%plot(ecgdata);
points=4000;%截取的点数
range=2:1:32;%尺度范围
sr=360;%抽样率
signal=ecgdata(1:points)';
figure,subplot(311)
plot(signal),axis tight,grid on;

% 对心电信号作小波变换，选'db1'为分析用小波
wf='db1';
subplot(312)
ccfs = cwt(signal,range,wf); 
imagesc(ccfs);
%title('Continuous Transform, coefficients.') 
colormap(gray(128)); 
%ylabel('Scale')
swd=ccfs;
ddw=zeros(size(swd));

% 对ECG信号进行分段
pddw=ddw;
nddw=ddw;
posw=swd.*(swd>0);
pdw=((posw(:,1:points-1)-posw(:,2:points))<0);
pddw(:,2:points-1)=((pdw(:,1:points-2)-pdw(:,2:points-1))>0);
negw=swd.*(swd<0);
ndw=((negw(:,1:points-1)-negw(:,2:points))>0);
nddw(:,2:points-1)=((ndw(:,1:points-2)-ndw(:,2:points-1))>0);
ddw=pddw|nddw;
ddw(:,1)=1;
ddw(:,points)=1;
wpeak=ddw.*swd;
wpeak(:,1)=wpeak(:,1)+1e-10;
wpeak(:,points)=wpeak(:,points)+1e-10;
%figure,imagesc(wpeak);
sam=sum(ccfs,1);
posi=sam.*(sam>0);
posi=(posi>max(posi)/2);
nega=sam.*(sam<0);
nega=-1*(nega<min(nega)/2);
interva=posi+nega;
loca=find(interva);
diff=interva(loca(1:length(loca)-1))-interva(loca(2:length(loca)));
seg=[1,round((loca(find((diff==2)))+loca(find((diff==2))+1))/2),points];%分段的结果保存在seg中
subplot(313)
plot(interva,'r--');
hold on;
plot(signal/100);
hold on
stem(seg,ones(length(seg))),grid on;

% 分别对每一段进行R波检测
for pha=1:length(seg)-1
    block=wpeak(:,[seg(pha):seg(pha+1)]);
    [maxvalue,maxpos]=max(block,[],2);
    coefposi=polyfit(range,maxpos',1);
    [minvalue,minpos]=min(block,[],2);% 找出模极大的位置和值
    coefnega=polyfit(range,minpos',1);% 对模极大点进行直线拟合找到最大线
    Rpeak(pha)=round((coefposi(2)+coefnega(2))/2+seg(pha)-1)/sr;% 每一段R波时刻存在Rpeak中
end  

% 绘制模极大随尺度变化的曲线
figure
subplot(223)
plot(log2(range),log2(abs(minvalue./sqrt(range'))),'b--');hold on;
plot(log2(range),log2(abs(maxvalue./sqrt(range'))),'r');grid on;
%xlabel('log2(s)'),ylabel('log2(maxima)'), 
%title('estimation of the singularity at the R peak'),, hold off;
R_R=Rpeak(2:length(Rpeak))-Rpeak(1:length(Rpeak)-1);
subplot(221)
imagesc(ccfs(:,[seg(pha):seg(pha+1)]));colormap(gray);
block=zeros(size(block));
for i=1:length(range)
    block(i,maxpos(i))=1;
    block(i,minpos(i))=-1;
end
subplot(222)
imagesc(block);colormap(gray);
subplot(224)
plot(maxpos,range,'r+'),hold on,plot(minpos,range,'k*'),grid on;
xr=[0, 1, range];
hold on,plot(xr*(coefnega(1))+coefnega(2),xr,'-');
hold on,plot(xr*(coefposi(1))+coefposi(2),xr,'--'); 