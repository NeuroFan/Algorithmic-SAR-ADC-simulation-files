IVR
*------------------ IVR-------------------           
*-------------------------------------------------

.subckt IVR	Mux_o	B0	B1	B2	B3	B4	B5	B6	B7	B8	B9
+SET0	SET1	SET2	SET3	SET4	SET5	SET6	SET7	SET8	SET9

XAND1	Mux_o	B0	SET0	NAND2 
XAND2	Mux_o	B1	SET1	NAND2 

XAND3	Mux_o	B2	SET2	NAND2 
XAND4	Mux_o	B3	SET3	NAND2 

XAND5	Mux_o	B4	SET4	NAND2 
XAND6	Mux_o	B5	SET5	NAND2 

XAND7	Mux_o	B6	SET6	NAND2 
XAND8	Mux_o	B7	SET7	NAND2 

XAND9	Mux_o	B8	SET8	NAND2 
XAND10	Mux_o	B9	SET9	NAND2 

.ends  IVR 
