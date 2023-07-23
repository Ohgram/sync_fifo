all:com sim

com: 
	vcs -debug_all -fsdb -sverilog -f flist.f -l com.log

sim:
	./simv \
	 -l sim.log

run:
	dve -vpd vcdplus.vpd

verdi:
	verdi -sv \
    -f flist.f \
    -top fifo_tb \
    -ssf tb.fsdb \
    -nologo &

clean:
	rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb verdi* *.out *.conf *.fsdb novas.rc