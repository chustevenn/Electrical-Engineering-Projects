signalMagnitudes = 0:0.01:3;
BER = zeros(1,301);
%Run Case A for 301 different signal magnitudes
for n = 1:301
    BER(n) = Case_A(signalMagnitudes(n));
end
figure();
%Convert S to SNR(dB)
SNR = 20*log10(signalMagnitudes);
%Plot simulated BER vs. SNR(dB)curve
semilogy(SNR, BER);
hold
syms x
f(x) = (1/((2*pi)^0.5))*exp(-((x-10.^(SNR/20)).^2)/2);
%{
We will approximate the improper integral to a sufficiently large
negative number
%}
F = int(f, x, -100, 0);
%Plot analytical BER vs. SNR(dB) curve
semilogy(SNR, F);
legend('Simulated Error Rates','Analytical Error Rate');
xlabel('Signal to Noise Ratio (SNR)');
ylabel('Bit Error Rate (BER)');
title('Simulation and Analysis of BER for Gaussian Noise');