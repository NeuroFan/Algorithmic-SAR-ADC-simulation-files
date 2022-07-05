MATLAB models include our tracking ADC and a few similiar works that are mentioned in the paper. The scripts perform quantization, generates quantized signals and report snr, ENOB and number of bit cycles for conversion of differnt types of signals using different SAR algorithms.

  
Our implementation is **"Arithmetic_Tracking_WorkingVersion.m"**. Uncomments instructions in lines 70 to 75 (and associated instructions above it) to change input signal type (ECG, EEG, image,etc.) . 

**"sar_adc.m"** is for simulation of regular SAR ADC. 
**"M_Bit_Fixed_With_1th_Order_Predication.m"** is a similiar tracking SAR ADC (refrenced in the paper 1). 


ECG signal generated using ECGSYN toolset can be found here: https://physionet.org/content/ecgsyn/1.0.0/Matlab/ecgsyn.m
EEG files are recieved the dataset downloaded form : http://bnci-horizon-2020.eu/database/data-sets
  


