function out_signal = channel(time,in_signal,snr,atn)
    out_signal = awgn(in_signal,snr); %suma ruido gaussinano blanco
    out_signal = atn * out_signal;  %atenua por el factor de perdidas del canal
    figure(1)
    plot(time,out_signal)
    title("Ruido blanco")
    xlabel("Tiempo(s)")
    ylabel("Amplitud")
    pause(5)
end
