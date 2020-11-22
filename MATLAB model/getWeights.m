
function Weights = getWeights(N)
    %generates DAC weights, N is number of ADC Bits
    Weights = ones(N,1);
    for i = 1:N
        Weights(i) = 1 / 2^i ;
    end
end
