% MATLAB script for Illustrative Problem 5.4.
clear
echo on
SNRindB1=0:1:12;
SNRindB2=0:0.1:12;
for i=1:length(SNRindB1),
  % simulated error rate
  smld_err_prb(i)=smldpe54(SNRindB1(i));   
  echo off ;
end;
echo on ;
for i=1:length(SNRindB2),
  SNR=exp(SNRindB2(i)*log(10)/10);  
  % theoretical error rate       
  theo_err_prb(i)=Qfunct(sqrt(SNR));  	    
  echo off ;
end;
echo on;
% Plotting commands follow.
figure;
semilogy(SNRindB1,smld_err_prb,'*');
hold
semilogy(SNRindB2,theo_err_prb);