
function Analog =  dac_block(digits, weights, v_ref)
Analog = sum(digits(:) .* weights(:)) * v_ref;
end 
