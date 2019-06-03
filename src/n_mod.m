function [mod_sig] = n_mod(message,Fs,D,A)
    len = length(message(:, 1));
    mod_sig = zeros(len*A, 2);
    EA = D*A;
    for i = A:A*len+A-1
        %modulate
        if(mod(floor(i/EA), 2) == 0)
            %Oversample by A
            mod_sig(i-A+1, :) = message(floor(i/A), :);
        end
    end
    
    in = 1:300;
    in2 = 1:300*A;
    in = in/Fs;
    in2 = [in2 + (A-1)]/Fs/A;
    plot(in, message(1:300, 1))
    hold on
    plot(in2, mod_sig(1:300*A, 1))
    
end
