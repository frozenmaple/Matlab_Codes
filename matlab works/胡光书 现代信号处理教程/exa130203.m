%--------------------------------------------------------------------------
% exa130203.m  ��13.2.3: ����С���任���R��,������ģ��������
%--------------------------------------------------------------------------
clear all;

ecgdata=load('ecg.txt');
%plot(ecgdata);
points=4000;%��ȡ�ĵ���
range=2:1:32;%�߶ȷ�Χ
sr=360;%������
signal=ecgdata(1:points)';
figure,subplot(311)
plot(signal),axis tight,grid on;

% ���ĵ��ź���С���任��ѡ'db1'Ϊ������С��
wf='db1';
subplot(312)
ccfs = cwt(signal,range,wf); 
imagesc(ccfs);
%title('Continuous Transform, coefficients.') 
colormap(gray(128)); 
%ylabel('Scale')
swd=ccfs;
ddw=zeros(size(swd));

% ��ECG�źŽ��зֶ�
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
seg=[1,round((loca(find((diff==2)))+loca(find((diff==2))+1))/2),points];%�ֶεĽ��������seg��
subplot(313)
plot(interva,'r--');
hold on;
plot(signal/100);
hold on
stem(seg,ones(length(seg))),grid on;

% �ֱ��ÿһ�ν���R�����
for pha=1:length(seg)-1
    block=wpeak(:,[seg(pha):seg(pha+1)]);
    [maxvalue,maxpos]=max(block,[],2);
    coefposi=polyfit(range,maxpos',1);
    [minvalue,minpos]=min(block,[],2);% �ҳ�ģ�����λ�ú�ֵ
    coefnega=polyfit(range,minpos',1);% ��ģ��������ֱ������ҵ������
    Rpeak(pha)=round((coefposi(2)+coefnega(2))/2+seg(pha)-1)/sr;% ÿһ��R��ʱ�̴���Rpeak��
end  

% ����ģ������߶ȱ仯������
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