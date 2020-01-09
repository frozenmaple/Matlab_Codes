%------------------------------------------------------------------- 
%    exa130402, De-noising by wavelet
%  ������������һ����Blocks���źţ�Ȼ����ϸ�˹������������'db3'С�����зֽ⣬
%  ��˵������ȡ��ֵ����������������־��ȥ�����ܵ�Ӱ�졣
%  ע���ڸó����У��õ����ӳ��� GWNoisy.m��
%      �ó�������������µ���վ������:
%                      http://www-stat.stanford.edu/~wavelab/
%      ��Ϊ����վ�ϵ�С�����������û������MATLAB�Ĺ����䣬�漰��֪ʶ��Ȩ���⣬
%      ��˲��ܽ���������ڹ����������ϣ������߿����������ء�
%-------------------------------------------------------------------
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
%subplot(321)
%plot(FBlock)
%title(' ԭ�ź�');  
%grid on;

% ���ϰ�����
sigma=0.2;
sig= GWNoisy(FBlock',sigma);
%subplot(323)
%plot(sig)
%title(' �����ź�');  
%grid on;

figure(1);
subplot(331), plot(sig);
%axis tight;
%title('the initial signal');

% С���ֽ�,�ֱ�ʹ�ò�ͬ����ֵѡ�񷽷���������־
[xds,cxds,lxds]=wden(sig,'sqtwolog','s','one',4,'db3');
subplot(332);plot(xds)
%title('sqtwolong');
[xds,cxds,lxds]=wden(sig,'sqtwolog','s','mln',4,'db3');
subplot(333);plot(xds)
%title('sqtwolong');

[xds,cxds,lxds]=wden(sig,'rigrsure','s','one',4,'db3');
subplot(334);plot(xds)
%title('rigrsure');
[xds,cxds,lxds]=wden(sig,'rigrsure','s','sln',4,'db3');
subplot(335);plot(xds)
%title('rigrsure');
[xds,cxds,lxds]=wden(sig,'rigrsure','s','mln',4,'db3');
subplot(336);plot(xds)
%title('rigrsure');

[xds,cxds,lxds]=wden(sig,'heursure','s','one',4,'db3');
subplot(337);plot(xds)
%title('heursure');
[xds,cxds,lxds]=wden(sig,'heursure','s','sln',4,'db3');
subplot(338);plot(xds)
%title('heursure');
[xds,cxds,lxds]=wden(sig,'heursure','s','mln',4,'db3');
subplot(339);plot(xds)
%title('heursure');




