function [StepSize,power] =  Predict(D,D_minus_1)
    Diff=D - D_minus_1; % Update next stage's StepSize
    p = nextpow2(abs(Diff));
    StepSize = 2.^(p);
    power = p;
end