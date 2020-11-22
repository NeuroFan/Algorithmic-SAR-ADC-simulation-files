*-------------------------------------------------
*------------------ NAND2*1-------------------           
*-------------------------------------------------

.subckt NAND2  in1  in2   out

Mnn1-2	n1	in1	ss	ss	N_10_SP	W=0.25u	 L=0.09u	M=2   
Mnn2-2	out	in2	n1	ss      N_10_SP	W=0.25u	 L=0.09u	M=2    


Mpn1-2	out	in1	ddd	ddd	P_10_SP	W=0.25u	 L=0.09u	M=2
Mpn2-2	out	in2	ddd	ddd	P_10_SP	W=0.25u	 L=0.09u	M=2


.ends  NAND2 
