% ip_04_13.m for spar
clear
a=randn(1,500);
[dist,a_quan,code]=mula_pcm(a,16,255);
[Y,I]=sort(a);
plot(Y,a_quan(I))