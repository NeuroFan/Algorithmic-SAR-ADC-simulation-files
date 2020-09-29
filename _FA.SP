*-------------------------------------------------
*------------------ 4NAND_XOR-------------------           
*-------------------------------------------------

.subckt	FA	A	B	C	Sum	Carry 

XOR1	A	B	N1	XOR_4ND 
XOR2	C	N1	Sum	XOR_4ND 

XAND1	C	N1	N2	AND2 
XAND2	A	B	N3	AND2 

X_OR	N2	N3	Carry	OR2 

.ends  FA 
