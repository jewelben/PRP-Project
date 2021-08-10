t = (0:0.0002:2)';
x = ones(size(t));
rayleighchan = comm.RayleighChannel();
y = rayleighchan(x);
figure(1);
plot(t,mag2db(abs(y).^2));
title("Rayleigh Channel Fading");
ylabel("Received signal power (dB)");
xlabel("time");
