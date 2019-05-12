%Demodulacion para Natural y Flat-Top
 st_frequency=fftshift(abs(fft(st))); %Transformada Rapida de Fourier(FFT) de S(t)
filter=fir1(200,fm/fs,'low'); %funcion del LPF
original_t_signal=conv(filter,st); %obtencion de funcion en t original
original_f_signal=fftshift(abs(fft(original_t_signal))); %obtencion de funcion en f original usando FFT
t1=0:1/(length(original_t_signal)-1):1; %periodo de tiempo para plot
f=-fs/2:fs/(length(original_f_signal)-1):fs/2; %frecuencia para plot
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
 
 
