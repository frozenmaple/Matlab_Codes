% MATLAB script for Illustrative Problem 4, Chapter 1.
clear
echo on
n=[-20:1:20];
% Fourier series coefficients of x(t) vector 
x=.5*(sinc(n/2)).^2;
% sampling interval
ts=1/40;
% time vector
t=[-.5:ts:1.5];
% impulse response
fs=1/ts;
h=[zeros(1,20),t(21:61),zeros(1,20)];
% transfer function
H=fft(h)/fs;
% frequency resolution
df=fs/80;
f=[0:df:fs]-fs/2;
% rearrange H
H1=fftshift(H);
y=x.*H1(21:61);
% Plotting commands follow.
