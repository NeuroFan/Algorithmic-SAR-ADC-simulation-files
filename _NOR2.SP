*-------------------------------------------------
*------------------ NOR2*1-------------------           
*-------------------------------------------------

.subckt NOR2  In1  In2   Out  


Mn1	Out	In1	ss	ss	N_10_SP	W=0.12u	 L=0.09u	M=2    
Mn2	Out	In2	ss	ss      N_10_SP	W=0.12u	 L=0.09u	M=2     


Mp1	Out	In1	dn	dd	P_10_SP	W=0.24u	 L=0.09u	M=2 
Mp2	dn	In2	dd	dd	P_10_SP	W=0.24u	 L=0.09u	M=2 


.ends  NOR2 
