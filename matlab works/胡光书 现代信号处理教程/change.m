%----------------------------------------------------------------
% To change the structure of a matrix
%----------------------------------------------------------------
function x=change(x)
[m,n]=size(x);
m1=m/2;
n1=n/2;
for k=1:m1;
   for l=1:n
      a(k,l)=x(k,l);
      b(k,l)=x(k+m1,l);
   end
   end
   for k=1:m1;
      for l=1:n;
         x(k,l)=b(k,l);
         x(k+m1,l)=a(k,l);
      end
      end
     

   


