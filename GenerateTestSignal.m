function Signal = GenerateTestSignal()
fSampling = 10^6;
T = 1./fSampling;

Vref=1;
L_epoch = 1000; %each epoch's length

t = (1:L_epoch).*T;


e1 = Vref./2*ones(size(t)); %from 0us to 2000us all are DC values eqaul to 512
e2 = e1 ; 

e3 = 0.5*Vref.*sin(2*pi*10^3*t)+Vref/2;  %1KHz signal
e4 = 0.25*Vref.*sin(2*pi*10*10^3*t)+Vref/2;
e5 = 0.5*Vref.*sin(2*pi*10*10^3*t)+Vref/2;

e6 = 0.25*Vref.*sin(2*pi*30*10^3*t)+Vref/2;
e7 = 0.5*Vref.*sin(2*pi*30*10^3*t)+Vref/2;


e8 =  (Vref/1024 * 20) * cos(2*pi*(fSampling/2)*t) + Vref/2; 

e9 = 0.5*Vref.*sin(2*pi*450*10^3*t)+Vref/2;

Signal = [-.01,e1,e2,e3,e4,e5,e6,e7,e8,e9,e3,1.01];
plot(Signal)

end
