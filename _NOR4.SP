*-------------------------------------------------
*------------------ NOR4-------------------           
*-------------------------------------------------

.subckt NOR4	I1	I2	I3	I4	Out 

XNOR1	I1	I2	X1	NOR2 
XNOR2	I3	I4	X2	NOR2 

XND	X1	X2	Outb	NAND2 
XNOT	Outb	Out	NOT 

.ends  NOR4 
