function  w2=Py_Pgama(w1,wpeak,wframe,level,sr);
% 该函数用于进行 Pgama 和 Py 投影
err=wpeak-w1.*(wpeak~=0);
w2=zeros(size(wpeak));
[r,c]=size(wpeak);
% 对每一级小波分别进行处理
for m=1:r
    frame=find(wpeak(m,:));
    num_interval=length(frame)-1;
    
    % 先找到以模极大划分的区间, 然后对每一区间进行Py投影
      for j=1:num_interval
          interval=w1(m,frame(j):frame(j+1));
          len=length(interval);
             if len>2
                w1(m,frame(j):frame(j+1))=P_y(interval,len);
             end
      end
   
      % 再逐一区间进行Pgama投影
      for j=1:num_interval
          interval=err(m,frame(j):frame(j+1));
          if r==1
              err(m,frame(j):frame(j+1))=P_gama(interval,level,sr);
          else
              err(m,frame(j):frame(j+1))=P_gama(interval,m,sr);
          end
      end
      w2(m,:)=w1(m,:)+err(m,:);
end

