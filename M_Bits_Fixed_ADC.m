clear
clc
close all

BitNumber = 10;
load('C:\Users\msafarpo\Downloads\A01S.mat')
Z2 = data{3}.X(1000:end,2)./max(data{1}.X(1000:end,1)) * 0.48 + 0.48;

N=4000;
%[ECG,ipeaks] = ecgsyn();

BitNumber = 10;
v_ref = 1;
global K; 

K = 4 ; %Number of locked MSBs
global TotalCycles ;
TotalCycles = 0;

global misPredict;
misPredict = 0;


N=10000;
fsampling=10^6;
t=(0:N-1)./fsampling;

fsignal=fsampling / 512 ; 
V_orginal= 0.00009*sin(2*pi*fsignal*t)+0.49; %some slow changing signal
%V_orginal = (ECG(1:N)'./max(ECG))./2.4 + 0.59  ;
%V_orginal = Z2;
%Vnoisy= V_orginal+ 0.000000001*rand(size(t));%+DAC(1,8)*rand(1,length(t))%-DAC(1,8)*rand(1,length(t));
Digital=zeros(N,BitNumber);
Digital(1,1) = 1 ; % [1 0 0 0 0 0 0 0];
ConvertedBack = zeros(N,1);
weights = getWeights(BitNumber); 
for i = 2:N
    S_and_H = V_orginal(i);
    [DACValues] = TrackingBoazhen(S_and_H,Digital(i-1,:), BitNumber, v_ref, 0,9);
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

disp("Average Cycles " + num2str(TotalCycles/N));
disp("Mis Rate %" + num2str(100*misPredict/N));
function [output] = TrackingBoazhen(v_in,previous_digita, B, v_ref, v_cm, M)
global K;
 %main function of sar adc of Boazhen
 %return a list of arrays, each string represents the converted digits of a DAC clock
 % k is number of LSBs that are resolved, N is ADC resolution, v_in input
 % sample and previous_digita is digital value for previouse sample
 weights = getWeights(B); 
 digits = previous_digita ; %zeros(N,1);
 digits(K:end) = 0; %Only MSBs are kept and the rest k bit are restet
 digits(K) = 1; %MSB of the subrange is set to one to be tested in following 
 output = zeros(B,B); %# define a list to restore the digits of each DAC clock
 
 Set_lower_bits_Hi = previous_digita; 
 Set_lower_bits_Low = previous_digita;
 Set_lower_bits_Hi(K:end) = 1; 
 Set_lower_bits_Low(K:end) = 0;
 global TotalCycles;
 global misPredict;
 
    TotalCycles = TotalCycles + 2; %Initial Tests
     if (v_in < dac_block(Set_lower_bits_Hi,weights,v_ref)) && (v_in > dac_block(Set_lower_bits_Low,weights,v_ref)) %if the input is in the range of k LSBs
            for i = K:B
            v_dac = dac_block(digits,weights,v_ref);
            %disp("v_dac : " + v_dac);
            diff = comparator(v_dac,v_in,v_cm);
            b = sar_logic(diff);
            digits = update_digits(b,i ,digits,B)
            %disp("digit : ");
            %disp(digits(:)');
            output(i,:) = digits;
            end
            TotalCycles = TotalCycles + (B-K+1);
            
            %sucess-> change k
            K=K+1;
            if (K==B-1)
                K=B-1;
            end

            
     else   %Failure to be in range
            output = sar_adc(v_in,B,v_ref,1); 
            K = 1; % Reset the Counter to zero
            TotalCycles = TotalCycles + B;
            misPredict = misPredict + 1;
     end
end
    