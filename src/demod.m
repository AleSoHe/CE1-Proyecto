%Demodulacion para Natural y Flat-Top
 
function[t1,f,original_t_signal,original_f_signal]=Demod(st,Fc,Fs) %Demodulation Function
%inputs: signal, single tone frecuency (cutoff frecuency), sample frecuency.

%outputs: reconstructed time vector, original signal, original signal spectrum.

    filter = butter(12,Fc/(Fs/2),'low'); % butterworth 12th order LPF with cutoff frecuency Fc/(Fs/2)
    
    gain_compdB = 12*20 + 20 + 3; % compensation factor for LPF order amplitude loss plus compensation of cutoff frecuency amp loss (in dB)
    
    gain_comp = 10^(gain_compdB/20) % compensation factor for LPF amplitude loss
    
     f_comp = (1/1000); %compensation factor for plotting in f
   
    original_t_signal = gain_comp*conv(filter,st); %convolution of filter function with st in the time domain
    
    original_f_signal =  f_comp*fftshift(abs(fft(original_t_signal))); %Absolute Value of Fast Fourier Transform  of the demodulated signal
    
    t1 = 0:1/Fs:(1/Fs)*length(original_t_signal)-1/Fs; %time span vector
    
    f =-Fc*100/2:Fc*100/(length(original_f_signal)-1):Fc*100/2; %frecuency span vector
    
    %plot
    
    figure(2)
     subplot(2,1,1);
     plot(t1,original_t_signal);
     title('Dominio del tiempo de la senal Demodulada');
     xlabel('Tiempo');
     ylabel('Amplitud');
     
    subplot(2,1,2);
     plot(f,original_f_signal);
     title('Dominio de la frecuencia');
     xlabel('Frecuencia');
     ylabel('Amplitud');
