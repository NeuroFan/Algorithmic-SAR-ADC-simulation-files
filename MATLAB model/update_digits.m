function up_digits = update_digits(bit,i, digits,N)
%bit is the comparator output, i is bit number, digits is binary value
up_digits = digits;
up_digits(i) =bit ;%update current bit

% make a tentative guess of the next digit
if i < N
    up_digits(i+1) = 1;
up_digits(i) = bit;
end