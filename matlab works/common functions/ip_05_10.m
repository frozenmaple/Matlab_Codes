% MATLAB script for Illustrative Problem 5.10.
clear
echo on
SNRindB=0:2:10;	  		       	
for i=1:length(SNRindB),
  % simulated error rate
  smld_err_prb(i)=smldp510(SNRindB(i));
  echo off;
end;
echo on;
% Plotting commands follow
semilogy(SNRindB,smld_err_prb,'*');