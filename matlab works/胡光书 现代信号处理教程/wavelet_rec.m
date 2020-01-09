function recsignal = wavelet_rec(deccoef,scales,wavelet)
%----------------------------------------------------------------------
% wavelet_rec.m, 函数子程序，用于多分辨率分析中的重建，使用  A'trous 算法；
%----------------------------------------------------------------------
[coefnum,coeflength] = size(deccoef);
A0 = deccoef(coefnum,:);
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wavelet);
Lo_D = Lo_D(find(Lo_D));
Hi_D = Hi_D(find(Hi_D));
Lo_R = Lo_R(find(Lo_R));
Hi_R = Hi_R(find(Hi_R));
Lo_Rlength = length(Lo_R);
Hi_Rlength = length(Hi_R);

j = scales;
interval = 2^(j)-1;
   Lo_Rtemp = zeros(1,Lo_Rlength+interval*(Lo_Rlength-1));
   Lo_Rtemp(1) = Lo_R(1);
   for k = 2:Lo_Rlength
      Lo_Rtemp((k-1)*(interval+1)+1)=Lo_R(k);
   end
   
   Hi_Rtemp = zeros(1,Hi_Rlength+interval*(Hi_Rlength-1));
   Hi_Rtemp(1) = Hi_R(1);
   for k = 2:Hi_Rlength
      Hi_Rtemp((k-1)*(interval+1)+1)=Hi_R(k);
   end
   Lo_R = Lo_Rtemp;
   Hi_R = Hi_Rtemp;
   Lo_Rlength = length(Lo_R);
   Hi_Rlength = length(Hi_R);

   while j > 0
      D0 = deccoef(j,:);
      Dtemp = conv(Hi_R,D0);
      Atemp = conv(Lo_R,A0);
      A = wkeep(Atemp,coeflength);
      D = wkeep(Dtemp,coeflength);
      A0 = (A+D)/2;
      Lo_Rtemp = Lo_R(1:2:Lo_Rlength);
      Hi_Rtemp = Hi_R(1:2:Hi_Rlength);
      Lo_R = Lo_Rtemp;
      Hi_R = Hi_Rtemp;
      Lo_Rlength = length(Lo_R);
      Hi_Rlength = length(Hi_R);
      j=j-1;
   end
   recsignal = A0;
