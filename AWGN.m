t = 1:0.001:10;
x = log(t);                 % input Signal
snr = 25;                   % snr stores the value of Signal to Noise Ratio in deciBel
y = awgn(x,25,'measured');  % adds Gaussian noise to signal
wn = y-x;                   % noise signal
% plotting
figure;
subplot(3,1,1);
plot(t,x);
title('Input Signal');
xlabel('t');
subplot(3,1,2);
plot(t,wn);
title('Noise Signal');
subplot(3,1,3);
plot(t,y);
title('Transmitted Signal');
xlabel('t');