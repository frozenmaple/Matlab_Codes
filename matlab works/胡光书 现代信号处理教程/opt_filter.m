%-----------------------------------------------------------------------------------------
% 本程序直接摘自文献：
%  S. K. Mitra.  Digital Signal Processing: A Computer-Based Approach. Second Edition,
%                McGraw-Hill,2001; 清华大学出版社，2001
%------------------------------------------------------------------------------------------
function [hopt,H,G]=opt_filter(N,nbands)
stopedge=1/nbands;
delta=0.001;
passedge=1/(4*nbands);
toll=0.000001;
step=0.1*passedge;
tcost=0;
mpc=1;
way=-1;
pcost=10;
flag=0;
s_time=cputime;
s_flops=flops;
while flag==0
    hopt=remez(N,[0,passedge,stopedge,1],[1,1,0,0],[5,1]);
%    length(hopt)
    figure(1)
    stem(hopt)
    Hw=fft(hopt,4096);
    HH=ovlp_ripple(Hw,nbands);
    [tcost]=max(abs(HH-ones(max(size(HH)),1)));
    if tcost>pcost
        step=step/2;
        way=-way;
    end
    if abs(pcost-tcost)<toll
        flag=1;
    end
    pcost=tcost;
    passedge=passedge+way*step;
end
final_time=cputime-s_time;
total_flops=flops-s_flops;

flen=max(size(hopt));
t=sqrt(2)/2;
for k=1:nbands
    a(2*k-1)=t+i*t;
    a(2*k)=t-i*t;
end
for k=1:nbands
    for l=1:flen
        m1=cos(pi*(2*k-1)*(2*l-1)/(4*nbands));
        m2=sin(pi*(2*k-1)*(2*l-1)/(4*nbands));
        H(k,l)=2.0*(real(a(k))*m1-imag(a(k))*m2)*hopt(l);
    end
    for l=1:flen
        m1=cos(pi*(2*k-1)*(2*l-1)/(4*nbands));
        m2=sin(pi*(2*k-1)*(2*l-1)/(4*nbands));
        G(k,l)=2.0*(real(a(k))*m1+imag(a(k))*m2)*hopt(l);
    end
 end
 
    