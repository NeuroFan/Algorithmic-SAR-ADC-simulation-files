
# Algorithmic SAR ADC simulation 
Arithmetic Tracking Adaptive SAR ADC for Low-activity Signals which include EEG, ECG, EKG, industrial and 2D (image) signals.

Main files:
 Arithmetic_Tracking_WorkingVersion.m : MATLAB file for simualtion behavior of the proposed SAR ADC 
 M_Bits_Fixed_ADC.m : MATLAB file for simualtion behavior of the a similiar tracking SAR ADC 

 Energy savings are two fold: 1. Cutting number of SAR cycles 2. Minimizing charge/decharge of MSB caps on DAC
  However, some overhead of the tracking algorithms Digital circuitry
  which of course can be alliviated by using high threshold transistors!
 (dual supplying incurs extra cost so to curb digital logic consumption
  it better to use high threshold transistors instead (if available)
  
 # Contributions of this work
 
 1.	Arithmetic SAR instead of conventional SAR provides more flexibility in tracking
2.	First order prediction is not cheap to implement (commonly requires a full adder/subtractor unit of its own along with a digital quantizer), whereas in the proposed work, this task is caried out by very simple circuit proposed by the authors.
3.	Due to cheap first-order prediction number of bit-cycles and system response to sudden activity change is better that the state-of-the-art.
4.	The authors did not stop at behavioral level and the algorithm was implemented in circuit level to demonstrated applicability of the method.
5.	Out-of-range detection requires extra bit-cycles which add to overhead and reduces gains of predictive approach as shown in the paper, however the proposed work detect out-of-range conversion merely through inspection of bit sequence generated by the comparted. The whole procedure is carried out digitally as a simple state-machine, without incurring extra bit-cycles as previous works cited in the paper (e.g. [9],[18] and [26] in references)

# Citation 
  
Please cite either of the following papers in case of using the provided simulations.

        @article{inanlou2020arithmetic,
          title={Arithmetic Tracking Adaptive SAR ADC for Signals with Low-activity Periods},
          author={Inanlou, Reza and Safarpour, Mehdi and Silv{\'e}n, Olli},
          journal={IEEE Access},
          year={2020},
          publisher={IEEE}
        }
        
        @inproceedings{safarpour2019reconfigurable,
        title={A Reconfigurable Dual-Mode Tracking SAR ADC without Analog Subtraction},
        author={Safarpour, Mehdi and Inanlou, Reza and Silv{\'e}n, Olli and Rahkonen, Timo and Shoaei, Omid},
        booktitle={2019 Signal Processing: Algorithms, Architectures, Arrangements, and Applications (SPA)},
        pages={28--32},
        year={2019},
        organization={IEEE}



