function [mod_sig] = n_mod(message,Fs,D,A)
    len = length(message(:, 1));
    mod_sig = zeros(len*A, 2);
    EA = D*A;
    message(len+1, :) = [0, 0];
    for i = A:A*len+A-1
        %modulate
        if(mod(floor(i/EA), 2) == 0)
            %Oversample by A
            a = floor(i/A);
            b = ceil(i/A);
            c = message(a, :);
            d = message(b, :);
            mod_sig(i-A+1, :) = (d-c)*(i/A-a) + c;
        end
    end
    
    in = 1:300;
    in2 = 1:300*A;
    in = in/Fs;
    in2 = [in2 + (A-1)]/Fs/A;
    figure(1), plot(in, message(1:300, 1))
    hold on
    figure(1), plot(in2, mod_sig(1:300*A, 1))
    
end
