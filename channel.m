snr=15;
out = awgn(modsig,snr);
figure(6)
hold on
plot(t1, out)
%Al hacer la demodulación se debe llamar la señal out
%Demod(out,Fc,Fs);
