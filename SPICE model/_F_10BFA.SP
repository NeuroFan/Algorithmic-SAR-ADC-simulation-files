*-------------------------------------------------
*------------------ 10BIT FULL-ADDER---------------           
*-------------------------------------------------

.subckt	F_10BFA	A0	B0	A1	B1	A2	B2	A3	B3	A4	B4	A5	B5	A6	B6	A7	B7	A8	B8	A9	B9
+Sub	Cin	S0	S1	S2	S3	S4	S5	S6	S7	S8	S9	C0	C1	C2	C3	C4	C5	C6	C7	C8	C9	


XOR0	Sub	B0	XR0	XOR_4ND 
XFA0	A0	XR0	Cin	S0	C0	FA 

XOR1	Sub	B1	XR1	XOR_4ND 
XFA1	A1	XR1	C0	S1	C1	FA 

XOR2	Sub	B2	XR2	XOR_4ND 
XFA2	A2	XR2	C1	S2	C2	FA 

XOR3	Sub	B3	XR3	XOR_4ND 
XFA3	A3	XR3	C2	S3	C3	FA 

XOR4	Sub	B4	XR4	XOR_4ND 
XFA4	A4	XR4	C3	S4	C4	FA 


XOR5	Sub	B5	XR5	XOR_4ND 
XFA5	A5	XR5	C4	S5	C5	FA 

XOR6	Sub	B6	XR6	XOR_4ND 
XFA6	A6	XR6	C5	S6	C6	FA 

XOR7	Sub	B7	XR7	XOR_4ND 
XFA7	A7	XR7	C6	S7	C7	FA 

XOR8	Sub	B8	XR8	XOR_4ND 
XFA8	A8	XR8	C7	S8	C8	FA 

XOR9	Sub	B9	XR9	XOR_4ND 
XFA9	A9	XR9	C8	S9	C9	FA

.ends	F_10BFA 
