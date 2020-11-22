function Analog =  dac_block(digital, N, v_ref)
Analog =  (digital/(2^N)).*v_ref;
end 
