close all;
clear all;

include;
fresolution = 100*MHz;
flim = 1*GHz;


band = ssps("Band limited signal",fresolution,[0 flim]);
band([.3*GHz .7*GHz]) = 0.6*W;
subplot(3,2,1)
band.disp;





subplot(3,2,2)
band.stem();


noise = ssps("Thermal Noise",fresolution,[0 flim]);;
noise([0 flim]) = (wgn(1,noise.length,0,'dBm',50)).^2/R;
#noise = noise.thermalNoise(50);
subplot(3,2,5)
noise.disp;

subplot(3,2,6)
noise.stem();

peaks = ssps("Peaks",fresolution,[0 flim]);
ampl = [10 2 1];
f_fund = .2*GHz;
peaks = peaks.peakAndHarmonics(f_fund,ampl);

subplot(3,2,3)
peaks.disp;

subplot(3,2,4)
peaks.stem();
