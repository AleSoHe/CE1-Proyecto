function error = metrics(original,demod)
    % metrics for a modulated/demodulated signal
    % INPUTS:
    %   original: signal without modulation and free of noise
    %   demod: signal after modulation, noise, and demodulation
    % OUTPUTS:
    %   

    % Fix phase shift of demodulated signal due to filters, channel, etc.

    % Original signal padding, as lengths could be different

    % Compute signals power
    original_power = (original.^2)./length(original);
    demod_power = (demod.^2)./length(demod);

    % Demodulated signal's power normalization
    demod = demod.*(original_power./demod_power);

    % Error cuadrático medio
    error = ((demod-origial).^2)./length(demod);
end

