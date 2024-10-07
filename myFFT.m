% 1.2 Implement FFT without using the built-in FFT function 
function X = myFFT(x)
    N = length(x); % Length of input signal
    if N <= 1
        X = x; % Base case for recursion
        return;
    end

    % Bit-reversal permutation
    j = 1;
    for i = 1:(N-1)
        if i < j
            % Swap elements
            x([i j]) = x([j i]);
        end
        k = N / 2;
        while k >= 1 && k < j
            j = j - k;
            k = k / 2;
        end
        j = j + k;
    end

    % FFT computation
    m = log2(N); % Number of stages
    for s = 1:m
        M = 2^s; % Length of the sub-sequences
        W_M = exp(-2i * pi / M); % Twiddle factor
        for k = 0:(M/2 - 1)
            W = exp(-2i * pi * k / M); % Calculate the twiddle factor for this stage
            for j = k+1:M:N
                t = W * x(j + M/2); % Multiply by twiddle factor
                u = x(j); % Input value
                x(j) = u + t; % Butterfly operation
                x(j + M/2) = u - t; % Butterfly operation
            end
        end
    end

    X = x; % Return the FFT result
end
