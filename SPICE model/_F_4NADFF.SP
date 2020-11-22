*-------------------------------------------------
*------------------ 4NADFF-------------------           
*-------------------------------------------------

.subckt	F_4NADFF	D	CLK	Q	Q!

XND1	D	CLK	out	NAND2

XND2	D!	CLK	outb	NAND2

XNT	D	D!	NOT

XRS	out	outb	Q	Q!	NASRL	


.ends  F_4NADFF 
