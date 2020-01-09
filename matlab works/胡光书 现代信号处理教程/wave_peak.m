function [signal,swa,swd,ddw,wpeak]=wave_peak(points,level,Lo_D,Hi_D,Lo_R,Hi_R,offset)
% �ú������ڶ�ȡecg�źţ��ҵ�С���任ģ��������

warning off;
ecgdata=load('ecg.txt');
plot(ecgdata(1:points)),grid on,axis tight,axis([1,points,-50,300]);
signal=ecgdata(1:points)'+offset;

%  �źŵ�С���任������������ò��ϸ�ڵĲ���
[swa,swd] = swt(signal,level,Lo_D,Hi_D);
figure;
subplot(level,1,1); plot(real(signal)); grid on;axis tight;
for i=1:level
    subplot(level+1,2,2*(i)+1);
    plot(swa(i,:)); axis tight;grid on;xlabel('time');
    ylabel(strcat('a   ',num2str(i)));
    subplot(level+1,2,2*(i)+2);
    plot(swd(i,:)); axis tight;grid on;
ylabel(strcat('d   ',num2str(i)));
end

%��С���任��ģ����ֵ����λ��
ddw=zeros(size(swd));
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

%��������С���任ģ����Ĳ���
figure;
for i=1:level
    subplot(level,1,i);
    plot(wpeak(i,:)); axis tight;grid on;
ylabel(strcat('j=   ',num2str(i)));
end
