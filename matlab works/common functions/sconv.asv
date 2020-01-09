function [y,t] = sconv(x1,t1,x2,t2,p)
% implements y(t) = x1(t) * x2(t) Á¬Ðø¾í»ý
% p = sample interval

%2012/2/21 by MAPLE
t_1 = min(t1)+min(t2);
t = t_1 :p: (length(t1)+length(t2)-2)*p;
y = p*conv(x1,x2);

end