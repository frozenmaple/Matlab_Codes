function xe = depcm(code,delta)
%增量调制译码函数
cdlen=length(code);
Dk=0;       %解码端预测器初始状态
for k=1:cdlen
    if (code(k)>0)
        err=delta;
    else
        err=-delta;
    end
    xe(k) = Dk+err;
    Dk=xe(k);     %更新预测值
end