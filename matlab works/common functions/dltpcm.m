function codeout = dltpcm(x,delta)
%���������Ʊ��뺯��
%���룺x �źţ�delta �����׾�

xlen=length(x);
Dk=0;               %Ԥ������ʼ״̬
for k=1:xlen
    err=x(k)-Dk;  %����ź�
    if (err>=0)
        qout=delta;     %���������
        codeout(k)=1;   %�������
    else
        qout=-delta;
        codeout(k)=0;
    end
    Dk=Dk+qout;
end