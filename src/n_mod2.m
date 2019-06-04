function mod_sig = n_mod2(message, mess_samp_freq, pulse_samp_freq, pulse_w_factor, t)

    mess_duration = length(message)/mess_samp_freq; %Raw signal duration in seconds
    
    pulse_samp_T = 1/pulse_samp_freq; %Calculate pulse sample period
    
    pulse_Ts = pulse_samp_T:pulse_samp_T:mess_duration; %Period vector for pulse train
    pulse_train = pulstran(t, pulse_Ts, @rectpuls, pulse_samp_T*pulse_w_factor);%Generate pulse train
    
    mod_sig = pulse_train.*message;
    
    figure(1)
    plot(t,mod_sig,'LineWidth',2)
    pause(10)
    hold off
    
end
