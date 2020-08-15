%% The main files:
% Arithmetic_Tracking_WorkingVersion.m : MATLAB file for simualtion behavior of the proposed SAR ADC 
% M_Bits_Fixed_ADC.m : MATLAB file for simualtion behavior of the a similiar tracking SAR ADC 

%% SAR ADC behavioral simulation for Arithmetic SAR + Regular_SAR 
% The summury of function: Limit the steps of conversion through tracking
% if this value is out of range, re-convert using regular SAR algorimth
% instead of tracking

%% Energy savings are two fold: 1. Cutting number of SAR cycles 2. Minimizing charge/decharge of MSB caps on DAC
%  However, some overhead of the tracking algorithms Digital circuitry
%  which of course can be alliviated by using high threshold transistors!
%  (dual supplying incurs extra cost so to curb digital logic consumption
%  it better to use high threshold transistors instead (if available)

clear
clc
close all

%% ADC parameters and settings

N=5000;
fsampling=10^6;
t=(0:N-1)./fsampling;

%load('C:\Users\msafarpo\Downloads\A01S.mat')
%Z2 = data{3}.X(1000:end,2)./max(data{1}.X(1000:end,1)) * 0.48 + 0.48;

BitNumber = 10;
v_ref = 1;

global TotalCycles; %This variable keeps total number of cycles consumed for conversion of a whole signal
TotalCycles = 0;

global misPredictions;
misPredictions = 0;

global InitialStepValue %This array keeps first step value for each sample
InitialStepValue = zeros(1,N);


%Notice ENOB is defined for a pure siniousd not for any signals so ignore
%ENOB values for other signals

%% Input Signal Prepration; Just remove the comments to activate different signals

%S=GenerateTestSignal(); % This generates siganls used in Chen's expriments
%N=length(S); %signal window length

%% pulse
%tp = 0 : 1/1e6 : .01;         
%dp = 0 : 1/50e2 : .01;           
%train = 0.9*pulstran(tp,dp,@rectpuls,1e-4)+0.1;

%% image
%I1 = imread('Lenna.png');
%I1 = rgb2gray(I1);
%I=v_ref * I1(:)./255; %scale to voltage range
%imshow(I1,[]);figure
%N=length(I);

%% ECG (the toolbox is required as references in the paper
%[ECG,ipeaks] = ecgsyn();

%% Generate simple sin
fsignal=fsampling / 64 ;
V_orginal= 0.4*sin(2*pi*fsignal*t)+0.5; %some slow changing signal

%%
%V_orginal = train;
%V_orginal = I;
%V_orginal = ECG; %also uncomment [ECG,ipeaks] = ecgsyn(); above
%V_orginal = Z2';
%V_orginal = S;

Digital=zeros(N,1);
PrevSamp=0; %Previous Sample 
QuantVal=0;
Cycles_Spend_for_Sample = zeros(N,1); %number of cycles spend for each samples individually; only for representation purposes
p = 5;
StepSize=256; % Step Counter is reset to starting step
InRangeCounter = 0; %If this counter is equal 
Max_number_of_cycles_for_each_conversion = 17

V_DAC_CycleByCyle = zeros(N*Max_number_of_cycles_for_each_conversion,1); % cycle by cycle voltage of DAC, N samples and for each sample there is Max_.. cycles 
%% Simulation of the proposed SAR ADC
%-------Outer loop: This loop takes a new sample in each iteration---------
cycle_counter=0;

for i=2:N
    QuantVal=PrevSamp;
    S_H = V_orginal(i);
    InRangeCounter = 0; %If this counter is equal
    Power_Gate = false; %if this bit is true then the ADC is power gated
    %---------------------inner loop: This loop does conversion on the sample----------
                    for j=1:Max_number_of_cycles_for_each_conversion %unkown number of SAR iterations so no ceiling
                         cycle_counter = cycle_counter+1;
                         if (Power_Gate==false) %if the conversion ended do not carry out the rest of cycles and but stand still and turned off
                             StepSize=floor(StepSize/2);  % functions as our shit register (right shift)
                             if S_H>DAC(QuantVal,BitNumber,v_ref)
                             InRangeCounter = InRangeCounter + 1;
                                 if (StepSize==0) %if we are before the last cycle (I want to simulate exactly the circuit behavior)
                                    QuantVal=QuantVal ; %Quantized Value
                                 else
                                     QuantVal=QuantVal + StepSize; %Quantized Value
                                 end
                             else
                             InRangeCounter = InRangeCounter - 1;
                                 if (StepSize==0)
                                    QuantVal=QuantVal - 1; %since step size is zero
                                 else
                                    QuantVal=QuantVal - StepSize;
                                 end
                             end

                            if (StepSize == 0)
                               Cycles_Spend_for_Sample(i) = j;
                                Power_Gate = true; %conversion for the current sample has ended therefore turn off the ADC
                            end
                         end
                            DAC_steps(i,j) = QuantVal; %both are same just to have different form
                            V_DAC_CycleByCyle(cycle_counter)=QuantVal;
                     end 

    TotalCycles = TotalCycles + Cycles_Spend_for_Sample(i);
    PrevSamp=QuantVal;
    Digital(i)=PrevSamp;
    if (InRangeCounter >= Cycles_Spend_for_Sample(i))|| (InRangeCounter <= -Cycles_Spend_for_Sample(i)) %Out of Range !!!
         StepSize = 2^BitNumber; 
         output = sar_adc(S_H,10,v_ref,1); 
         misPredictions = misPredictions + 1;
         TotalCycles = TotalCycles + BitNumber;
         Cycles_Spend_for_Sample(i) = Cycles_Spend_for_Sample(i)+BitNumber;
    else
        [StepSize,p] = predict ( Digital(i), Digital(i-1));
        StepSize = StepSize*2;
    end
    if StepSize<4
        StepSize = 4;
        %StepSize
    end
    InitialStepValue(i) = StepSize;
    %StepSize = StepSize*2; % since in this algorithm
    

end
%% Representation and etc

%X = floor(V_orginal(N/4:3*N/4)./v_ref*(2^BitNumber-1) ); %ignore begining part of signal, due to tracking it is not converted properly
%Y = Digital(N/4:3*N/4)';

X = floor(V_orginal./v_ref*(2^BitNumber-1) ); %ignore begining part of signal, due to tracking it is not converted properly
Y = Digital';

plot(X,'g')

hold on
%errorbar(1:1:length(Digital),Digital(1:1:end),InitialStepValue(1:1:end),'.r')
hold on
stairs(Y)
legend("Input signal","Digital signal");
Digital=Digital(:);
whn=hanning(length(Digital));

% SNR = snr(X,X-Y);
% ENOB = (SNR-1.76)/6.02;
% disp("SNR "+num2str(SNR));
% disp("ENOB  "+ num2str(ENOB))
disp("Average Cycles " + num2str(TotalCycles/N));
disp("Average Misses " + num2str(misPredictions/N));

figure
stairs(V_DAC_CycleByCyle,'r')
legend("DAC voltage");
% 
% figure
% 
% plot(movmean(Cycles_Spend_for_Sample,128))
