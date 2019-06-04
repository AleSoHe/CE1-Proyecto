function [MSE,SNR] = metrics(original,demod_sig,demod_noise)
    % metrics for a modulated/demodulated signal
    % INPUTS:
    %   original: signal without modulation and free of noise
    %   demod: signal after modulation, noise, and demodulation
    % OUTPUTS:
    %   MSE: mean squared error
    %   SNR: signal to noise ratio

    % Fix phase shift of demodulated signal due to filters, channel, etc.

    % Original signal padding, as lengths could be different

    % Compute signals power
    original_power = sum((original.^2))./length(original);
    demod_power = sum((demod_sig.^2))./length(demod_sig);

    % Demodulated signal's power normalization
    demod_norm = demod_sig.*(original_power/demod_power);

    % Mean Squared Error
    MSE = sum(((demod_norm-original').^2))/length(demod_norm);
    
    % Noise
    noise = demod_noise - demod_sig; % demodulated signal - demodulated signal with noise
    
    % Noise power
    noise_power = sum(noise.^2)/length(noise);
    
    % Signal to noise ratio (output)
    SNR = demod_power/noise_power;
    
    disp(['Error cuadrático medio: ',num2str(MSE)]);
    disp(['Razón de señal a ruido: ',num2str(SNR)]);
    
end

