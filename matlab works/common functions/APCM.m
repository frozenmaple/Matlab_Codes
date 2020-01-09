function code = APCM(x,n)
% 该函数实现对输入序列X，进行n位的A律PCM编码

xmax = max(abs(x));                                             %序列中的最大值
x=x/xmax;                                                           %序列的归一化
xlen=length(x);     %序列长度

y=zeros(1,xlen);    %置零数组，用于存放压缩后的序列的归一化值
A=87.6;     %压缩程度A取典型值87.6
A1=1+log(A);

%A律压缩
for i=1:xlen
    if x(i)>=0
        if x(i)<=1/A
            y(i) = (A*x(i))/A1;
        else
            y(i) = (1+log(A*x(i)))/A1;
        end
    else
        x1=-x(i);
        if x1<=1/A
             y(i) = -(A*x1)/A1;
        else
            y(i) = -(1+log(A*x1))/A1;
        end
    end
end

y1=y*(2^(n-1)-1);   %scale?
y1=round(y1);       %取整
code = zeros(length(y1),n);     %码字数组置零，行数为样值数，列数为编码位数

c2=zeros(1,n-1);     %段落码和段内码c2~c7

%PCM折叠码
for i=1:length(y1)
    if (y1(i)>0)
        c1=1;
    else
        c1=0;
        y1(i)=-y1(i);
    end
    for j=1:n-1
        r=rem(y1(i),2);
        y1(i)=(y1(i)-r)/2;
        c2(j)=r;
    end
    c2=fliplr(c2);
    code(i,:)=[c1 c2];
end