F_4BCNT
*------------------ F_4BCNT-------------------           
*-------------------------------------------------

.subckt F_4BCNT	CLK 	Pre	CLR	Q0	Q1	Q2	Q3	Q0!	Q1!	Q2!	Q3!

XDFF0	Q0!	CLR	CLK	Pre	Q0	Q0!	DFF1

XDFF1	Q1!	CLR	Q0!	Pre	Q1	Q1!	DFF1

XDFF2	Q2!	CLR	Q1!	Pre	Q2	Q2!	DFF1

XDFF3	Q3!	CLR	Q2!	Pre	Q3	Q3!	DFF1

.ends  F_4BCNT

