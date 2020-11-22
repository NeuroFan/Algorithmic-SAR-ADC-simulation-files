
function [output,NumericOutput] = sar_adc(v_in, BitNumber, v_ref, v_cm)
 %main function of sar adc
 %return a list of arrays, each string represents the converted digits of a DAC clock
 weights = getWeights(BitNumber); 
 digits = zeros(BitNumber,1);
 digits(1) = 1; %MSB has the lowest index (little endian)
 output = zeros(BitNumber,BitNumber); %# define a list to restore the digits of each DAC clock
      for i = 1:BitNumber
        v_dac = dac_block(digits,weights,v_ref);
        %disp("v_dac : " + v_dac);
        diff = comparator(v_dac,v_in,v_cm);
        b = sar_logic(diff);
        digits = update_digits(b,i ,digits,BitNumber);
        %disp("digit : ");
        %disp(digits(:)');
        output(i,:) = digits;
     end
NumericOutput = sum(digits.*weights.*2^BitNumber);
end
    
