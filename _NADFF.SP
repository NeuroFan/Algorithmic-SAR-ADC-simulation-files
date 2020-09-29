*-------------------------------------------------
*------------------ NADFF-------------------           
*-------------------------------------------------


.subckt	NADFF	D	CLK	Q	Q!

XND1	D	CLK	out	NAND2
XND2	D!	CLK	outb	NAND2
XNT	D	D!	NOT
XRS	out	outb	Q	Q!	NASRL
	

.ends  NADFF 









*.lib './Tech90nm/MOSFET_HSPICE_MODEL/L90_SP10_V051.lib' tt

*.temp 27

*.include	'NOT.sp'
*.include 	'NAND2.sp'
*.include 	'NASRL.sp'


*.global dd ss 

*Vdd    dd      ss	dc=0.5

*Vss    ss      0	dc=0


*vsamp	d	ss	pulse(0.5	0	0.25U	tt	tt	tp	tsar)

*vph1	CLK	ss	pulse(0	0.5	0	tt	tt	tstp	tsa)




*.op


*.param	fck='8*10^6hz'	tck='1/fck'	pchw='tck/2-tt'	tt='50p'	tsar='10*tck'	tsa='2*tsar'	tar='10*tck'	tstp='tsar-tck/2'	tp='tck-2*tt'	tpc='2*tp' to='2*tck'	


*.param tstart='1.2u'   tstep='tsar'  nfft=pow(2,10)  

*.param tstop ='tstart+tstep*nfft'
*.param tstart='0u'   tstep='tsar'  tstop='10u'

*.measure tran ivdd avg i(vdd)  from=tstart   to=tstop




*.tran tstep  tstop  tstart 


*.option accurate=1
*.option ingold=1
*.option   probe post
 
*.probe  v(D),v(D!),v(outb),v(out),V(Q),v(Q!),v(D3),v(D2),v(D1),v(D0),v(R),v(daco-),v(Shift),v(stop),v(dpt),v(SMP)

*.probe  v(ph1),v(ph2),v(clkb),v(in+),v(in-),v(RST),v(obs),v(obs!),v(clk),v(cm),v(RST9+),v(RST8+),v(REF9+),v(REF8+),v(dbu4+),v(dbu3+),v(dbu2+),v(dbu1+),v(dbu0+),v(dbu+)

						
*.end

