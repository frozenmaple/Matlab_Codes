function  w2=Py_Pgama(w1,wpeak,wframe,level,sr);
% �ú������ڽ��� Pgama �� Py ͶӰ
err=wpeak-w1.*(wpeak~=0);
w2=zeros(size(wpeak));
[r,c]=size(wpeak);
% ��ÿһ��С���ֱ���д���
for m=1:r
    frame=find(wpeak(m,:));
    num_interval=length(frame)-1;
    
    % ���ҵ���ģ���󻮷ֵ�����, Ȼ���ÿһ�������PyͶӰ
      for j=1:num_interval
          interval=w1(m,frame(j):frame(j+1));
          len=length(interval);
             if len>2
                w1(m,frame(j):frame(j+1))=P_y(interval,len);
             end
      end
   
      % ����һ�������PgamaͶӰ
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

