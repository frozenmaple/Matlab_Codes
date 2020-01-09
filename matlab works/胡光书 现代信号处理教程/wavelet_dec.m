function deccoef = wavelet_dec(signal,scales,wavelet);
%----------------------------------------------------------------------
% wavelet_dec.m, 函数子程序，用于多分辨率分解，使用  A'trous 算法；
%                在分解的过程中，同时给出各级的细节和概貌，它们
%                和原数据有着同样的长度。
%----------------------------------------------------------------------
coeflength = size(signal,2);
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wavelet);
Lo_D = Lo_D(find(Lo_D));
Hi_D = Hi_D(find(Hi_D));
Lo_R = Lo_R(find(Lo_R));
Hi_R = Hi_R(find(Hi_R));

deccoef = [];
figure(gcf);
   j = 0;
   A0 = signal;
   A0length = length(A0);
  
   while j < scales
      LoDlength = length(Lo_D);
      HiDlength = length(Hi_D);
      Dtemp = conv(Hi_D,A0);
      Atemp = conv(Lo_D,A0);
      A = wkeep(Atemp,coeflength);
      D = wkeep(Dtemp,coeflength);
      deccoef(j+1,:)= D;
 %---------------------------------------------------------------
 % Plot the Approximated coefficients and Detail coefficients
      subplot(scales+1,2,2*j+3);    
      plot(A);
      label = strcat('a ',num2str(j+1));
      Ylabel(label);
      subplot(scales+1,2,2*j+4);
      plot(D);
      label = strcat('d ',num2str(j+1));
      Ylabel(label);
 %-------------------------------------------------------------- 
      Lo = zeros(1,2*LoDlength-1);
      Hi = zeros(1,2*HiDlength-1);
      Lo(1:2:2*LoDlength-1)=Lo_D;
      Hi(1:2:2*HiDlength-1)=Hi_D;
      Lo_D = Lo;
      Hi_D = Hi;
      A0 = A;
      j=j+1;
   end
   deccoef(j+1,:)= A;
