*-------------------------------------------------
*------------------ DFF-------------------           
*-------------------------------------------------

.subckt	DFF	D	CLR	CLK	Pre	Q 

XND1	Pre	out2	out4	out1	NAND3
XND2	CLR	CLK	out1	out2	NAND3
XND3	out2	CLK	out4	out3	NAND3
XND4	CLR	D	out3	out4	NAND3
XND5	Pre	out2	Q!	Q	NAND3
XND6	CLR	out3	Q	Q!	NAND3

.ends  DFF 
