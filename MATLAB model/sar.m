clear
clc
close all
dir

%SAR ADC behavioral simulation
BitNumber = 8;
v_ref = 1.2;
K = 6 ; %Number of locked MSBs
global TotalCycles ;
TotalCycles = 0;
N=10000;
fsampling=10^3;
fsignal=fsampling / 10000 ;
t=(0:N-1)./fsampling;
V_orginal= 0.49*sin(2*pi*fsignal*t)+0.48 + 0.00000001*rand(size(t)) ;

%Vnoisy= V_orginal+ 0.000000001*rand(size(t));%+DAC(1,8)*rand(1,length(t))%-DAC(1,8)*rand(1,length(t));
Digital=zeros(N,BitNumber);
ConvertedBack = zeros(N,1);
weights = getWeights(BitNumber); 
for i = 1:N
    S_and_H = V_orginal(i);
    DACValues = sar_adc(S_and_H, BitNumber, v_ref, 0);
    TotalCycles = TotalCycles + BitNumber;
    Digital(i,:) = DACValues(end,:);
    ConvertedBack(i) = dac_block(Digital(i,:),weights,v_ref);
end
plot(V_orginal);
hold on
stairs(ConvertedBack);


X = V_orginal(N/4:3*N/4); %ignore begining part of signal, due to tracking it is not converted properly
Y = ConvertedBack(N/4:3*N/4)';
SNR = snr(X,X-Y);
ENOB = (SNR-1.76)/6.02;
disp("SNR "+num2str(SNR));
disp("ENOB  "+ num2str(ENOB))