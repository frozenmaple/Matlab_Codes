function codeout=dltpcm_adp(x,delta,kup,kdown)
% ����Ӧ�����������
%���룺x �ź���ֵ���У�delta �����׾ࣻkup �����׾���չϵ����kdown �����׾�ѹ��ϵ��
xlen=length(x);     %������ֵ���г���
Di = 0;     %Ԥ������ʼֵ
err1=0;
err2=0;
for i=1:xlen
    err1 = x(i)-Di;
    if (err1>=0)
        qout=delta;
        codeout(i)=1;
    else
        qout=-delta;
        codeout(i)=0;
    end
    
%�ӵڶ�����ֵ��ʼ����Ӧ�����׾�    
    if i>1                                  
        if (err1*err2>=0)      %���������������ͬ���ţ���ʱ����б�ʱ�Ȼ��Զ��ͣ�
            delta=kup*delta;    %ʹ�����׾������Լ�Сб��ʧ��
        else                          %��������������ͬ���ţ���ʱ����б�ʱ�Ȼ���ƽ����
            delta=kdown*delta;%ʹ�����׾��С�Լ�С��������
        end
    end
    Di=Di+qout;    %Ԥ��������Ԥ��ֵ
    err2=err1;
end