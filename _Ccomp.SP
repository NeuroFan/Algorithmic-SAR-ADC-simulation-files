Ccomp


.subck 	Ccomp	in+	in-	out

*****************************************************************************
*****************stage#1*****************************************************

Idc	ddc	dpt	1u
 
Mp1	dp1	in+	dpt	dpt	P_10_SP	W=2u	 L=80n	M=2	
Mp2	dp2	in-	dpt	dpt     P_10_SP	W=2u	 L=80n	M=2	

Mn1	dp2	dp1	ss	ss	N_10_SP	W=1u	L=80n M=2  
Mn2	dp1	dp2	ss	ss      N_10_SP	W=1u	L=80n M=2

Mn3	dp2	dp2	ss	ss	N_10_SP	W=1u	L=80n M=1  
Mn4	dp1	dp1	ss	ss      N_10_SP	W=1u	L=80n M=1

Mn5	vv	dp2	ss	ss	N_10_SP	W=1u	L=80n M=2  
Mn6	yy	dp1	ss	ss      N_10_SP	W=1u	L=80n M=2


Mp3	vv	vv	ddc	ddc	P_10_SP	W=3u	 L=80n	M=1  
Mp4	yy	vv	ddc	ddc	P_10_SP	W=3u	 L=80n	M=1  


XNOT	yy	out	NOT

.ends Ccomp


	
