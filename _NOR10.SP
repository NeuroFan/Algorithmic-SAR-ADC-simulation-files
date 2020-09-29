*-------------------------------------------------
*------------------ NOR10-------------------           
*-------------------------------------------------

.subckt NOR10	I1	I2	I3	I4	I5	I6	I7	I8	I9	I10	Out 

XR8	I1	I2	I3	I4	I5	I6	I7	I8	X1b	NOR8
XNT	X1b	X1	NOT 
XR4	ss	ss	I9	I10	X2	OR4 
*XNAND3	X1	I9	I10	Outb	NAND3 

*XNOT	Outb	Out	NOT 

XOR2	X1	X2	Out	NOR2 
.ends  NOR10
