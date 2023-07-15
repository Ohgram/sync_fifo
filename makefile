all:com sim

com: 
	vcs -debug_all -fsdb -sverilog -f file.f -l com.log

sim:
	./simv \
	 -l sim.log

run:
	dve -vpd vcdplus.vpd

verdi:
	verdi -sv \
    -f file.f \
    -top tb_top \
    -ssf tb.fsdb \
    -nologo &

clean:
	rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb verdi* *.out *.conf *.fsdb novas.rc