% 2.2 Implement IFFT in MATLAB using the FFT function
function x_inv = myIFFT(X)
    N = length(X); % Length of input sequence
    X_conj = conj(X); % Conjugate the input sequence
    x_inv = myFFT(X_conj); % Compute FFT of conjugated sequence
    x_inv = conj(x_inv) / N; % Conjugate and scale the result
end