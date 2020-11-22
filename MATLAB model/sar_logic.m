
function bit =  sar_logic(diff)
% determine the digit bit according to the difference between
% v_dac and v_in
    if (diff <= 0)
        bit =  1;
    else
        bit = 0;
    end
end
    