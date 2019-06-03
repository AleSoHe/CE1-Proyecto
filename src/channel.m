function out_signal = channel(time,in_signal)
    snr=15;
    out = awgn(in_signal,snr);
    figure(1)
    hold on
    plot(time,out)
    waitforbuttonpress;
end
