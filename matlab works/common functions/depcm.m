function xe = depcm(code,delta)
%�����������뺯��
cdlen=length(code);
Dk=0;       %�����Ԥ������ʼ״̬
for k=1:cdlen
    if (code(k)>0)
        err=delta;
    else
        err=-delta;
    end
    xe(k) = Dk+err;
    Dk=xe(k);     %����Ԥ��ֵ
end