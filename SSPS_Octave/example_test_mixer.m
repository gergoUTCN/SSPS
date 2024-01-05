close all;
clear all;

include;

%define the conditions for the workspace
flim = 10*GHz;
fresolution = 1*MHz;
noise_floor_dBm = -174 + 10*log10(flim) ; %noise floor (minimum possible noise without any noise figure)
freq = linspace(0, flim, (flim/fresolution)+1);
freq2 = linspace(-2*flim, 2*flim, 4*(flim/fresolution)+1);

sig = ssps("Signal", fresolution,[0 flim]);
sig = sig + sig.thermalNoise(50,flim);
% generate signal of interest (band)
f_cent = 5e9;
fb = 0.2e9;
sig = sig + sig.bandpass(f_cent,fb,1*mW);


%generate peak and harmonics
f_fund = 1e9;
carrier = ssps("Carrier", fresolution,[0 flim]);
carrier = carrier + carrier.thermalNoise(50,flim);
carrier = carrier + carrier.peakAndHarmonics(f_fund,[1*mW 0.1*mW 0.01*mW]);

subplot(3,1,1)
sig.dBm;


subplot(3,1,2)
carrier.dBm


modulat = ssps("Modulat", fresolution,[0 flim]);
modulat = sig * carrier;

subplot(3,1,3)
modulat.dBm
