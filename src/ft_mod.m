function mod_sig = ft_mod(message, mess_samp_freq, pulse_samp_freq, pulse_w_factor, t)%,noise
    %Assuming that the raw signal is cut to desired time frame:
    
    mess_duration = length(message)/mess_samp_freq; %Raw signal duration in seconds
    
    pulse_samp_T = 1/pulse_samp_freq; %Calculate pulse sample period
    
    pulse_Ts = pulse_samp_T:pulse_samp_T:mess_duration; %Period vector for pulse train
    pulse_train = pulstran(t, pulse_Ts, @rectpuls, pulse_samp_T*pulse_w_factor);%Generate pulse train 
    
    for i = 1:length(t)-1
        if pulse_train(i)== 0 && pulse_train(i+1) == 1 %If the rising edge is detected
            mod_sig(i) = pulse_train(i+1) * message(i); %Sampling occurs
        elseif pulse_train(i) == 1 && pulse_train(i+1) == 1 %While the carrier signal is 1
            mod_sig(i) = mod_sig(i-1); %The value of mod_sig remains constant    
        else
            mod_sig(i) = 0; %Otherwise, the value for mod_sig is zero
        end
    end 
    
    %Last value of the array:
    i = length(t);
    if pulse_train(i)== 0 && pulse_train(i-1) == 1
        mod_sig(i) = pulse_train(i-1) * message(i);
    elseif pulse_train(i) == 1 && pulse_train(i-1) == 1
        mod_sig(i) = mod_sig(i-1);             
    else
        mod_sig(i) = 0;                
    end
    
    figure(1)
    plot(t,mod_sig,'LineWidth',2)
    pause(10)
    hold off
    
    %figure(2)
    %plot(t,pulse_train)

end
