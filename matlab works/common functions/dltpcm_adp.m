function codeout=dltpcm_adp(x,delta,kup,kdown)
% 自适应增量编码程序
%输入：x 信号样值序列；delta 量化阶距；kup 量化阶距扩展系数；kdown 量化阶距压缩系数
xlen=length(x);     %数据样值序列长度
Di = 0;     %预测器初始值
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
    
%从第二个样值开始自适应调整阶距    
    if i>1                                  
        if (err1*err2>=0)      %若连续的量化误差同符号（此时波形斜率必然相对陡峭）
            delta=kup*delta;    %使量化阶距增大以减小斜率失真
        else                          %若连续的量化误差不同符号（此时波形斜率必然相对平缓）
            delta=kdown*delta;%使量化阶距减小以减小量化噪声
        end
    end
    Di=Di+qout;    %预测器更新预测值
    err2=err1;
end