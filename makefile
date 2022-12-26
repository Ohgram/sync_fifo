all:com sim

com: 
	vcs -debug_all ./tb/fifo_tb.v ./rtl/sync_fifo.v -l com.log

sim:
	./simv -l sim.log

run:
	dve -vpd vcdplus.vpd

clean:
	rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb verdi* *.out *.conf *.fsdb