function xe=depcm_adp(code,delta,kup,kdown)
%����Ӧ�����������
%���룺code �������У�delta �����׾ࣻkup �����׾���չϵ����kdown �����׾�ѹ��ϵ��

cdlen=length(code);
Di=0;
for i=1:cdlen
    if (code(i)>0)
        qout=delta;
    else
        qout=-delta;
    end

    if i>1
        if (code(i)==code(i-1))
            delta=kup*delta;
        else
            delta=kdown*delta;
        end
    end
    
    xe(i)=Di+qout;
    Di = xe(i);     %Ԥ��������Ԥ��ֵ
end