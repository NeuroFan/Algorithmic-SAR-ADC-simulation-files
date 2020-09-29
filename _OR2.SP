*-------------------------------------------------
*------------------ OR2*1-------------------           
*-------------------------------------------------

.subckt OR2  innO1  innO2   outnO  


MnnO1	ounO	innO1	ss	ss	N_10_SP	W=0.12u	 L=0.09u	M=2    
MnnO2	ounO	innO2	ss	ss      N_10_SP	W=0.12u	 L=0.09u	M=2     


MpnO1	ounO	innO1	dno	ddd	P_10_SP	W=0.24u	 L=0.09u	M=2 
MpnO2	dno	innO2	ddd	ddd	P_10_SP	W=0.24u	 L=0.09u	M=2 

XNot    ounO   outnO   NOT

.ends  OR2 
