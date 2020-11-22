*-------------------------------------------------
*------------------ NASRL-------------------           
*-------------------------------------------------

.subckt NASRL  in1  in2   out	outb

XND1	in1	outb	out	NAND2
XND2	in2	out	outb	NAND2

.ends  NASRL 
