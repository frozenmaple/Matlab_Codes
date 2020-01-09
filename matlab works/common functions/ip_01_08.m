% MATLAB script for Illustrartive Problem 8, Chapter 1.
clear
ts=0.001;                          
Fs=1/ts;                           
t=[0:ts:10];                       
x=cos(2*pi*47*t)+cos(2*pi*219*t);  
p=spower(x);                        
h = spectrum.periodogram; 
Hpsd = psd(h,x,'Fs',Fs);             % Calculate the PSD 
pause   % Press a key to see the power in the signal.
p
pause   % Press a key to see the power spectrum.
plot(Hpsd)                           % Plot the PSD.
