%Demodulacion para Natural y Flat-Top

%Funcion de demodulacion, recibe la senal modulada, fm y fs y tiene de salidas el tiempo y la funcion de la onda original, asi como frecuencia y la onda transformada en f.(Propositos de ploteo)
 function[t1,f,original_t_signal,original_f_signal]=Demod(st,fm) 
 
 fs = 10*fm
%Calculo de la transformada Rapida de Fourier para propositos de ploteo
 st_frequency=fftshift(abs(fft(st))); 
 
 %Filtro de Demodulacion LPF
filter=fir1(200,fm/fs,'low');

 %reconstruccion de funcion en t original
original_t_signal=conv(filter,st);

%obtencion de funcion en f original usando FFT
original_f_signal=fftshift(abs(fft(original_t_signal))); 

%periodo de tiempo para plot
t1=0:1/(length(original_t_signal)-1):1; 

%frecuencia para plot
f=-fs/2:fs/(length(original_f_signal)-1):fs/2; 

%ploteo
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
 
