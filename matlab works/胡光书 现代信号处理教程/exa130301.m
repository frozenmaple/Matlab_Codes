%--------------------------------------------------------------------------
% exa130301.m  ��13.3.1: ����С���任ģ�����ؽ�ԭ�ź�
%--------------------------------------------------------------------------
close all;
points=1024;        level=6;    sr=360;   num_inter=6;   wf='db3';
%���������ݵĳ��� �ֽ�ļ���   ������     ��������      С������

offset=0;
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(wf);

%����С���ֽ�ϵ����ģ��������
[signal,swa,swd,ddw,wpeak]=wave_peak(points,level,Lo_D,Hi_D,Lo_R,Hi_R,offset);
% signal:  ԭʼ�ź�;       swa:С����ò;  swd:С��ϸ��;
% ddw:     �ֲ�����λ��; wpeak:С���任�ľֲ���������]

pswa=swa(level,:);  % pswa: Ϊ���ؽ����ź�
wframe=(wpeak~=0);
%������ʼ��
w0=zeros(1,points);
[a,d]=swt(w0,level,Lo_D,Hi_D);
w2=d;  % w2Ϊ���ؽ�С��
    for j=1:num_inter
       w2=Py_Pgama(d,wpeak,wframe,1,sr);   % �Ƚ���PyͶӰ�� PgamaͶӰ
       w0=iswt(pswa,w2,Lo_R,Hi_R);         % �ٽ���PvͶӰ
       [a,d]=swt(w0,level,Lo_D,Hi_D);      % Pv
    end
     pswa=iswt(swa(level,:),w2,Lo_R,Hi_R); % �����ؽ��ź�
     
% ԭ�źź���ģ�����ؽ��źŵıȽ�
figure,
subplot(211)
plot(pswa(1:points)); 
subplot(212)
plot(signal(1:points),'r');

%�ֱ�����ؽ�С���Լ�ԭ�źŵ������
werr=w2-swd;
% ԭ�źŵ�С���任��swd)���ؽ����С���任��w2���ıȽ�
figure,
for m=1:level
    wsnr(m)=20*log10(norm(swd(m,:))/norm(werr(m,:)))
    subplot(level+1,1,m);
    plot(swd(m,:)),hold on,
    plot(w2(m,:),'r');grid on;ylabel(strcat('j=',num2str(m))),axis tight;
end
err=pswa(1:points)-signal(1:points);
snr=20*log10(norm(signal)/norm(err))