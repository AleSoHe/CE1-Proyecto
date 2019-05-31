%Demodulacion para Natural y Flat-Top
 
function[t1,f,original_t_signal,original_f_signal]=Demod(st,Fc,Fs) %funcion de demodulacion 

    filter = butter(15,Fc/(Fs/2),'low'); %funcion del LPF con fc normalizada
    
    original_t_signal = conv(filter,st); %convolucion de la funcion de transferencia del filtro LPF con la senal modulada
    
    original_f_signal = fftshift(abs(fft(original_t_signal))); %obtencion de funcion en f original usando FFT
    
    t1 = 0:1/Fs:(1/Fs)*length(original_t_signal)-1/Fs; %periodo de tiempo para plot
    
    f =-Fc*100/2:Fc*100/(length(original_f_signal)-1):Fc*100/2; %frecuencia para plot
    
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

 
© 2019 GitHub, Inc.
 
