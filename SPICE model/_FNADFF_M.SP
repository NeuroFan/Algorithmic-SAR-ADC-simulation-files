*-------------------------------------------------
*------------------ FNADFF_M-------------------           
*-------------------------------------------------

.subckt	FNADFF_M	D	CLKi	Q

XND1	D	CLKi!	out	NAND2

XND2	D!	CLKi!	outb	NAND2

XNT1	D	D!	NOT
XNT2	clki	clki!	NOT

XRS	out	outb	Q	NASRL	


.ends  FNADFF_M 
