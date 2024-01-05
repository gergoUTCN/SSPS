SSPS (SINGLE-SIDED POWER SPECTRUM), OCTAVE SIMULATION TOOL

This tool was created to make possible the modeling of different signal types, mathematical operations, and the creation of filter and mixer components via full band modelling method. 
The aim is to model an entire processing chain for radio frequency signals. 
SSPS Octave Simulation tool will be presented in the following simple examples:


Three types of input signals are availabe in SSPS library: band type, peak and harmonics and thermal noise.


![1](https://github.com/gergoUTCN/SSPS/assets/155771215/9a922bb1-be2c-4d4c-abd1-1d0f361451d2) ![2](https://github.com/gergoUTCN/SSPS/assets/155771215/4eca9882-890d-4735-aa27-14a7614f0f90)

Figure 1 a. Signal generation modelling example: Peak and harmonics type signal power spectrum represented with N=10 bins on 10 GHz bandwidth frequency base 


Figure 1 b. Signal generation modelling example: Band type signal power spectrum represented with N=10 bins on 10 GHz bandwidth frequency base





The mean value of the thermal noise is calculated according to the simple spectrum analyzer bandwidth – thermal dependency:
	P_(dBm_mean_noise)=-174+10*log10(BW) 
where BW is the  bandwidth in Hz.



The values of the thermal noise bins are generated using Gaussian-distribution.




![3](https://github.com/gergoUTCN/SSPS/assets/155771215/0ffc9872-ea17-4a55-9c6c-39d58a36ac12) ![4](https://github.com/gergoUTCN/SSPS/assets/155771215/7732bc1f-edb8-4265-9a1d-0bc58dc634f9)


Figure 2 a. Signal generation modelling example: Noise type signal power spectrum represented with N=10 bins on 10 GHz bandwidth frequency base 


Figure 2 b. Filter modelling example: 5th order low pass filter transmission log-mag characteristics represented with N=100 bins on 10 GHz bandwidth frequency base



Filter characteristics generation is also available via SSPS library. The assumption regarding the generation of filter characteristics implies that signals outside the passband are attenuated in proportion
to the difference between the signal frequency and the filter's cutoff frequency. This attenuation is equivalent to 20 dB per decade multiplied by the filter's order. Filter generation is presented by
generating a low-pass filter characteristic with cut-off frequency equal to 2 GHz. Attenuating linearly across decades yields the following logarithmic magnitude transmission characteristics for the filter:
An important element in radio-frequency signal processing is the mixer. The working principle will be illustrated by taking the convolution of a peak and harmonics noise affected signal power spectrum
with a noise affected bandpass signal power spectrum.



![5](https://github.com/gergoUTCN/SSPS/assets/155771215/016292eb-5f56-4eff-bf56-24cb0388cb78)

 Figure 3: Mixer modelling example: convolution of two noise affected signals represented with N=10000 bins on 10 GHz bandwidth frequency base




 
To make the simulation model accurate and realistic an ADC sampling feature was also included that illustrates aliasing in the power spectrum representation of the signals.
If the sampling frequency of the processed signal is known, the phenomenon of aliasing can be modelled also using the SSPS library.


![6](https://github.com/gergoUTCN/SSPS/assets/155771215/d27b9017-991d-49c4-92e3-7bcaa5b2e2c9)

Figure 4: Power spectrum representation of aliasing phenomenom for 7 GHz central frequency, 150 MHz bandwitdh signal processed with 2 GHz sampling frequency
