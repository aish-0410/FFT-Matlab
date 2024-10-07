# Signal Processing Using FFT and IFFT in MATLAB
Overview
This project involves implementing and analyzing Fast Fourier Transform (FFT) and Inverse Fast Fourier Transform (IFFT) algorithms from scratch in MATLAB. The work focuses on:

Creating and manipulating signals.
Implementing custom FFT and IFFT functions without relying on MATLAB's built-in functions.
Visualizing signal transformations in both time and frequency domains.

Files
HW_2.m: Main script containing the tasks for signal creation, processing, and transformation using FFT and IFFT.
myFFT.m: Custom implementation of the FFT algorithm.
myIFFT.m: Custom implementation of the IFFT algorithm.

Project Structure
1. Signal Creation
A signal x[n] = e^{-0.03t}sin[t] is created with a length of 128 samples.
The signal is visualized using MATLAB’s plot function to understand its behavior in the time domain.
2. Fast Fourier Transform (FFT)
The myFFT.m script implements the FFT algorithm from scratch, following a recursive divide-and-conquer approach.
The bit-reversal permutation is applied to reorder the input sequence, followed by the recursive computation of the FFT.
3. Inverse Fast Fourier Transform (IFFT)
The myIFFT.m script computes the IFFT by leveraging the custom FFT function.
The IFFT is computed by conjugating the input sequence, applying FFT, and then conjugating and scaling the result to return to the time domain.
4. Visualization
Both the time-domain signal and its frequency-domain representation are plotted to illustrate the effects of FFT and IFFT transformations.

Key Functions
myFFT(x): Computes the Fast Fourier Transform of the input sequence x using a recursive approach.
myIFFT(X): Computes the Inverse Fast Fourier Transform of the frequency-domain sequence X by applying the custom FFT function and appropriate scaling.

Dependencies
MATLAB (tested on version R2022a)
