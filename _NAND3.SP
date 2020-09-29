*-------------------------------------------------
*------------------ NAND3*1-------------------           
*-------------------------------------------------

.subckt NAND3  inn1  inn2  inn3 outn  


Mnn1	n1	inn1	ss	ss	 N_10_SP	W=0.18u	 L=0.09u	M=2   
Mnn2	n2	inn2	n1	ss       N_10_SP        W=0.18u	 L=0.09u	M=2    
Mnn3	outn	inn3	n2	ss	 N_10_SP	W=0.18u	 L=0.09u	M=2

Mpn1	outn	inn1	ddd	ddd	 P_10_SP	W=0.12u	 L=0.09u	M=2
Mpn2	outn	inn2	ddd	ddd	 P_10_SP	W=0.12u	 L=0.09u	M=2
Mpn3	outn	inn3	ddd	ddd	 P_10_SP	W=0.12u	 L=0.09u	M=2


.ends  NAND3 
