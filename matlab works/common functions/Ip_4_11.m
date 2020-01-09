t=[0:0.01:10];
a=sin(t);
[sqnr8,aquan8,code8]=u_pcm(a,8);
[sqnr16,aquan16,code16]=u_pcm(a,16);
plot(t,a,t,aquan8,t,aquan16);