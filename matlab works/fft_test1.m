clear all;
close all;
Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 100;                     % Length of signal
t = (0:L-1)*T;                % Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t);
% + sin(2*pi*120*t); 
y = x;
% + 2*randn(size(t));     % Sinusoids plus noise
plot(t,y);
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)');

N=100;
df=Fs/N;                       %frequency resolution?
Y = fft(y,N);
f=(0:df:Fs-df);
% -Fs/2;              %frequency scale
YY=2*abs(Y)/N;
figure;plot(f,YY);