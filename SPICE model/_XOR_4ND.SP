*-------------------------------------------------
*------------------ 4NAND_XOR-------------------           
*-------------------------------------------------

.subckt XOR_4ND	A	B	Q 

XND1	A	B	X	NAND2 
XND2	A	X	X1	NAND2 

XND3	B	X	X2	NAND2 
XND4	X1	X2	Q	NAND2 

.ends  XOR_4ND 
