function output = equalizer(input, Fs, BW, signal_name)

    % This function receives an "input" signal, of bandwidth "BW", sampled with
    % a "Fs" frequency
    % The input signal is processed by an equalizer (1/sa), and the result is
    % the output of the function

    % Signal resampling
    n = 1;
    input = resample(input,1,n);
    Fs = Fs/n;

    % Compute normialized cutoff frequency
    norm_cutoff = BW/Fs;

    % Filter design
    d = fdesign.isinclp('N,Fp,Fst',20,norm_cutoff,norm_cutoff+0.1);
    Hd = design(d,'SincFrequencyFactor',0.9,'SincPower',1,'SystemObject',true);
    
    % Plot equalizer magnitude response
    fvtool(Hd, 'MagnitudeDisplay', 'Magnitude');
    title(strcat('Respuesta en magnitud del ecualizador para la señal ',signal_name))
    pause(5)
    
    % Signal equalization
    output = Hd(input);
    plot(output)
    title(strcat('Señal ', signal_name, ' ecualizada'))
    pause(5)
    
    close all
    % Play music
    %sound(output,Fs);
end