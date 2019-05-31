function [R] = PAMn(y,Fs,D,A)
len = length(y(:, 1));
R = zeros(len*A, 2);
EA = D*A;
for i = A:A*len+A-1
    %modulate
    if(mod(floor(i/EA), 2) == 0)
        %Oversample by A
        R(i-A+1, :) = y(floor(i/A), :);
    end
end
%{
in = 1:300;
in2 = 1:300*A;
in = in/Fs;
in2 = [in2 + (A-1)]/Fs/A;
plot(in, y(1:300, 1))
hold on
plot(in2, R(1:300*A, 1))
%}
end