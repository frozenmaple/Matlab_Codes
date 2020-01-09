function codeout = dltpcm(x,delta)
%简单增量调制编码函数
%输入：x 信号；delta 量化阶距

xlen=length(x);
Dk=0;               %预测器初始状态
for k=1:xlen
    err=x(k)-Dk;  %误差信号
    if (err>=0)
        qout=delta;     %量化器输出
        codeout(k)=1;   %编码输出
    else
        qout=-delta;
        codeout(k)=0;
    end
    Dk=Dk+qout;
end