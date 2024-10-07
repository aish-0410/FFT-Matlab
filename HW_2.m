% Name:Omer Pintel
% ID: 316085554

%Name:Guy Geva Iluz
%ID: 206817918

%----------------------------------HW2-------------------------------------

% -------- Q1 --------
% 1.1 Create and plot a signal of length 128
% Parameters
N = 128; % Length of the signal
t = linspace(0, 2*pi, N); % Time vector

% Signal definition
x = exp(-0.03 * t) .* sin(t); % Signal x[n] = e^{-0.03t}sin[t]

% Plot the signal
figure;
plot(t, x);
title('Signal x[n] = e^{-0.03t}sin[t]');
xlabel('t');
ylabel('x[n]');
grid on;

% 1.3 Plot the FFT signal X[k]
X = myFFT(x);

% Plot FFT
figure;
stem(abs(X));
title('FFT of the signal X[k]');
xlabel('k');
ylabel('|X[k]|');
grid on;

% 1.4 Preformance comparison between FFT and DFT
% Direct DFT function
function X = myDFT(x)
    N = length(x); % Length of input signal
    X = zeros(1, N); % Initialize output
    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-2i * pi * k * n / N); % Compute DFT
        end
    end
end

% Performance comparison
tic;
X_dft = myDFT(x); % Compute DFT
dft_time = toc; % Measure time for DFT

tic;
X_fft = myFFT(x); % Compute FFT
fft_time = toc; % Measure time for FFT

fprintf('DFT time: %.6f seconds\n', dft_time);
fprintf('FFT time: %.6f seconds\n', fft_time);

% -------- Q2 --------
% Use of FFT to compute the IFFT

% 2.1 Explain the use of FFT to compute IFFT
% To compute the IFFT using FFT, we did the following steps:
%   Conjugate the input sequence X[k].
%   Apply the FFT to the conjugated sequence.
%   Conjugate the resulting sequence.
%   Divide the sequence by the length of the original input sequence N.

% 2.3 Plot the original and the restored signals
x_restored = myIFFT(X);

% Plot original and restored signals
figure;
subplot(2, 1, 1);
plot(t, x);
title('Original Signal x[n]');
xlabel('t');
ylabel('x[n]');
grid on;

subplot(2, 1, 2);
plot(t, real(x_restored));
title('Restored Signal x''[n]');
xlabel('t');
ylabel('x''[n]');
grid on;
