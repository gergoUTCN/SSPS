close all;
clear all;

include;

%define the conditions for the workspace
flim = 10e9;
fresolution = 1e8;

% generate signal of interest (band)
sig = ssps("Signal", fresolution,[0 flim]);
sig = sig + sig.thermalNoise(50,flim);
f_cent = 5e9;
fb = 8e9;
sig = sig + sig.bandpass(f_cent,fb,1*mW);
subplot(3,1,1)
sig.dBm;

%generate LPF

  Fc = 3.5e9;

  ord = 20;
  filter = ssps("LPF",fresolution,[0 flim]);
  filter = filter.LPF(Fc,ord,flim);
  subplot(3,1,2)
  filter.dB;

% LPF filtering of sig
  sig = sig .* filter;
  sig = sig + sig.thermalNoise(50,flim);

  subplot(3,1,3)
  sig.dBm;
