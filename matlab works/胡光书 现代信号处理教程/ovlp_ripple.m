%-----------------------------------------------------------------------------------------
% 本程序直接摘自文献：
%  S. K. Mitra.  Digital Signal Processing: A Computer-Based Approach. Second Edition,
%                McGraw-Hill,2001; 清华大学出版社，2001
%------------------------------------------------------------------------------------------
function H=ovlp_ripple(Hin,Q)
N=max(size(Hin));
M=floor(2048/Q);H=zeros(M,1);
for k=1:M
    H(k)=abs(Hin(M-k+2))^2+abs(Hin(k))^2;
end
