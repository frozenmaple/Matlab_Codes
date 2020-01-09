% -----------------------------------------------------------------------����
%   exa130202.m,   ��13.2.2
%  ��弤��������Ծ���������Ǻ�����С���任��ģ�����߲������ǵ�����ָ��
%  ע���ڸó����У��õ����ӳ��� RWT.m��
%      �ó�������������µ���վ������:
%                      http://www-stat.stanford.edu/~wavelab/
%      ��Ϊ����վ�ϵ�С�����������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%------------------------------------------------------------------------
close all;

nvoice = 16;
%   nvoice��ʾÿ2��s֮�䱻��Ϊ���ٵ�

wavelet = 'Sombrero'; 
% ѡ��С������ѡ���С�������� 'Gauss','DerGauss','Morlet'and'Sombrero'(mexh)
    N = 64*8;
    n = N;
    oct = 5;
    scale = 8;
   	noctave = floor(log2(n))-oct;
	nscale  = nvoice .* noctave;
    ytix   = linspace(2+(oct-floor(log2(scale))),log2(N)+2-floor(log2(scale)),nscale);
%  ytix ��imageRWT�����õ� ������Ӧ����log2(s)
%  ytix = linspace(log2(scale)-noctave,log2(scale),nscale);
    xtix   = linspace(0,N,N);
for count=1:3
   if count==1
        sig = zeros(1,N);sig(N/2) =sig(N/2) +1;% �弤����
        ti='�弤����';
    elseif count==2
        sig = zeros(1,N);sig(N/4:3*N/4) = sig(N/4:3*N/4)+1; % ���δ�
        ti='���δ�';
    else
        sig(N/4:N/2) = linspace(0,1,N/4+1);
        sig(N/2:3*N/4) = linspace(1,0,N/4+1); % ���Ǵ�
        ti='���Ǵ�';
    end
    sig = sig+1e-8*randn(1,N);
    rwt = RWT(sig,nvoice,wavelet,oct,scale);
    [n,nscale] = size(rwt);
   
    subplot(4,3,count); % ��ʾ�źŲ���
    plot(sig);grid;title(ti);
    axis([1 N min(sig)-.1 max(sig)+.1]);
    subplot(4,3,3+count); % ��ʾС���任���
    imagesc(xtix,ytix,flipud(rwt'));colormap(gray);
     maxmap = MM_RWT(rwt);
%  maxmap������rwt��ͬ��С�ľ��󣬵���maxima��Ϊ1��������Ϊ0

   [skellist,skelptr,skellen] = SkelMap(maxmap);
% skellist ���μ�¼��ÿ��"ɽ��"�������(j,i):[j1,i1,j2,i2,...]��
% ��������������궼��������
% skelptr Ϊָ��skellist��"ָ��"skelptr��n��Ԫ����ָ��n��"ɽ��"�������skellist�е�λ�á�
% ��skelptr(2)=65��skelptr(3)=129����skellist(65:128)���ǵ�2��"ɽ��"�ϸ��������ԡ�
% skellen(n)���ǵ�n��"ɽ��"����skellist�еĳ��ȡ�
 
    block=rwt';
%   �ҳ����ֵ����λ��
    [maxvalue,maxpos]=max(block,[],2);
%   �ҳ���Сֵ����λ��
    [minvalue,minpos]=min(block,[],2);
    subplot(4,3,6+count); % ���������С��
    PlotSkelMap(n,nscale,skellist,skelptr(:),skellen(:),'','b',[],nvoice,min(ytix),noctave);grid;
    ylabel('')
%    ylabel('log2(s)');
    subplot(4,3,9+count);% ����б��
%    plot(ytix,log2(abs(flipud(minvalue)))-ytix'/2,'b-');hold on;
%   ��ɫʵ��Ϊ��С�ߣ�  -ytix'/2�����൱�ڳ���sqrt(s)
%   
    plot(ytix,log2(abs(flipud(minvalue))),'b-');hold on;

%      ��log2()֮��./sqrt(2.^ytix')����log2()֮��-ytix'/2��Ч
    plot(ytix,log2(abs(flipud(maxvalue))),'r--');
    grid on;
    hold off;
 end
