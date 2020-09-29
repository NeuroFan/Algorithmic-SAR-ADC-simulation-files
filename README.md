
# Algorithmic-SAR-ADC-simulation-files
Arithmetic Tracking Adaptive SAR ADCfor Low-activity Signals

Main files:
 Arithmetic_Tracking_WorkingVersion.m : MATLAB file for simualtion behavior of the proposed SAR ADC 
 M_Bits_Fixed_ADC.m : MATLAB file for simualtion behavior of the a similiar tracking SAR ADC 

 Energy savings are two fold: 1. Cutting number of SAR cycles 2. Minimizing charge/decharge of MSB caps on DAC
  However, some overhead of the tracking algorithms Digital circuitry
  which of course can be alliviated by using high threshold transistors!
 (dual supplying incurs extra cost so to curb digital logic consumption
  it better to use high threshold transistors instead (if available)
  
Please cite the following paper in case of using the provided simulations [1].

References:

[1] Reza Inanlou, Mehdi Safarpour, Olli Silven, "Arithmetic Tracking Adaptive SAR ADC for Low-activity Signals", IEEE, 2020.

