*-------------------------------------------------
*------------------ NE-DFF-------------------           
*-------------------------------------------------

.subckt	NE_DFF	D	CLK	Q

XNOT1	CLK	CLKB	NOT

Mn1	D	CLK	S1	ss	N_10_SP	W=0.25u	 L=0.09u	M=2   
Mp1	S1	CLKB	D	D	P_10_SP	W=0.25u	 L=0.09u	M=2
   

Mn2	S1	CLKB	S2	ss	N_10_SP	W=0.25u	 L=0.09u	M=2   
Mp2	S2	CLK	S1	S1	P_10_SP	W=0.25u	 L=0.09u	M=2


XNOT2	S1	X	NOT
XNOT3	X	S2	NOT

Mn3	S2	CLKB	S3	ss	N_10_SP	W=0.25u	 L=0.09u	M=2   
Mp3	S3	CLK	S2	S2	P_10_SP	W=0.25u	 L=0.09u	M=2


XNOT4	S3	Y	NOT
XNOT5	Y	Q	NOT

Mn4	S3	CLK	Q	ss	N_10_SP	W=0.25u	 L=0.09u	M=2   
Mp4	Q	CLKB	S3	S3	P_10_SP	W=0.25u	 L=0.09u	M=2


.ends  NE_DFF 
