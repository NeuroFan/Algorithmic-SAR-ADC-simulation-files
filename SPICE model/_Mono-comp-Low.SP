Mono-comp-Low


.subck 	Mono-comp-Low	in+	in-	CLKC	outp	outn	Valid	

*****************************************************************************
*****************stage#1*****************************************************

Mpt	dpt	CLKC	ddc	ddc	P_10_SP	W=.4u	 L=100n	M=1     
Mp1	dp1	in+	dpt	dpt	P_10_SP	W=.4u	 L=80n	M=2	
Mp2	dp2	in-	dpt	dpt     P_10_SP	W=.4u	 L=80n	M=2	

Mn1	dp2	dp1	ss	ss	N_10_SP	W=.2u	L=80n M=2  
Mn2	dp1	dp2	ss	ss      N_10_SP	W=.2u	L=80n M=2

Mn3	dp2	CLKC	ss	ss	N_10_SP	W=.2u	L=80n M=2  
Mn4	dp1	CLKC	ss	ss      N_10_SP	W=.2u	L=80n M=2

Mn5	outp	dp1	ss	ss	N_10_SP	W=.2u	L=80n M=2  
Mn6	outn	dp2	ss	ss      N_10_SP	W=.2u	L=80n M=2


Mp3	outp	dp1	ddc	ddc	P_10_SP	W=.4u	 L=80n	M=2  
Mp4	outn	dp2	ddc	ddc	P_10_SP	W=.4u	 L=80n	M=2  


XND	outp	outn	Valid	NAND2

.ends Mono-comp-Low


	
