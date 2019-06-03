function out_signal = channel(time,in_signal)
    snr=15;
    out_signal = awgn(in_signal,snr);
    figure(1)
    hold on
    plot(time,out_signal)
    waitforbuttonpress;
end
