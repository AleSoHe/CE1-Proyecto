function original_t_signal = demod(st,Fc,Fs) 

    [b,a] = butter(6,(Fc/(Fs/2)),'low'); %funcion del LPF con fc normalizada

    gain_compdB = 12*20 + 20 + 3; %gain amp factor in dB for order = 12 plus 20db of initial loss + 3db of cutoff frequency range
    gain_comp = 10^(gain_compdB/20); %gain amp factor 
    f_comp = (1/1000); %frequency comp factor

    %original_t_signal = gain_comp*conv(filter,st); %convolucion de la funcion de transferencia del filtro LPF con la senal modulada
    original_t_signal = filter(b,a,st);
    
    original_f_signal = f_comp*fftshift(abs(fft(original_t_signal))); %obtencion de funcion en f original usando FFT

    t1 = 0:1/Fs:(1/Fs)*length(original_t_signal)-1/Fs; %periodo de tiempo para plot

    f =-Fc*100/2:Fc*100/(length(original_f_signal)-1):Fc*100/2; %frecuencia para plot

    %plot
    figure(1)
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
    
    pause(5)
    close all
    %freqz(filter);
