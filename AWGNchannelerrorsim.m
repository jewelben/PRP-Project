a = 0.25;
x = [-a;a]; %Transmitted signal BPSK
N = 20000;
SNR = [15 16 17 18 19 20 21 22 23 24 25]; %SNR in dB
P_E = zeros(size(SNR));
for mm = 1:length(SNR)
    E = 0;
    for nn = 1:N
        m = x(randi(2));
        y = awgn(m,SNR(mm)); %Recieved signal
        if y >= 0
            estimate = a; % Estimate of decoder
        else
            estimate = -a;
        end
        I = ~isequal(m,estimate); % Error occurs if the transmitted message does not match the estimate
        E = E+I;
    end
    P_E(mm) = E/N; % Probability of error
end

% We observe exponential decrease in error probability with increase in SNR
figure(1);
plot(SNR,P_E,'-o');
xticks(SNR);
title("Probability of error for BPSK in AWGN channel");
xlabel("SNR (dB)");
ylabel("P_{error}");