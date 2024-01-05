close all;
clear all;
include;

Fresolution = 5*MHz;
Flim = 10*GHz;
sig = ssps("Band",Fresolution,[0 Flim]);
sig = sig.addBandpass(7000*MHz, 30*MHz, 0.1*W);
sig = sig.addThermalNoise(50,Flim);

subplot(3,1,1);
sig.dBm

#sampling with 2000MHz;
subplot(3,1,2);
Fsampling = 2*GHz;
sig2Ghz = sig.sampling(Fsampling);
sig2Ghz.dBm

#removing periodicity & displaying FS
subplot(3,1,3);
sig2Ghz = sig2Ghz.cut([0 Fsampling]);
sig2Ghz.dBFS(1*V,0,50*Ohm);



