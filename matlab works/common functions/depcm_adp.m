function xe=depcm_adp(code,delta,kup,kdown)
%自适应增量解码程序
%输入：code 码字序列；delta 量化阶距；kup 量化阶距扩展系数；kdown 量化阶距压缩系数

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
    Di = xe(i);     %预测器更新预测值
end