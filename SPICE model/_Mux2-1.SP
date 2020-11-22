*-------------------------------------------------
*------------------ 4NAND_XOR-------------------           
*-------------------------------------------------

.subckt MUX2-1	SEL	I1	I2	Out 

XND1	I1	SELB	X1	NAND2 
XNOT	SEL	SELB	NOT
XND2	I2	SEL	X2	NAND2 

XND3	X1	X2	Out 	NAND2 

.ends  MUX2-1 
