function pc3inte=P_y(interval,len);
% 该函数对区间进行裁减即Py投影，返回裁剪后的区间信号

if sign(interval(1))==sign(interval(len))
    interval=interval.*(sign(interval)==sign(interval(1)));
    inte=interp1([1,len],[interval(1),interval(len)],(1:len),'linear');
    interval=sign(interval(1))*(abs(inte)-(abs(inte)-abs(interval)).*((abs(inte)-abs(interval))>0));
else
    sgn=sign(interval(len)-interval(1));
    intemax=max([interval(1),interval(len)]);
    intemin=min([interval(1),interval(len)]);
    for i=1:len-2
        if sign(interval(i+1)-interval(i))~=sgn
            interval(i+1)=interval(i);
        end
        if interval(i+1)>intemax
            interval(i+1)=intemax;
        end
       if interval(i+1)<intemin
                interval(i+1)=intemin;
        end
    end
end
pc3inte=interval;