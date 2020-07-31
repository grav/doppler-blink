synthesize: demo.h

demo.blif: top.v
	yosys -q -p "synth_ice40 -blif demo.blif" top.v

demo.h: demo.bin
	xxd -i demo.bin  > demo.h
	sed -i -r 's/unsigned/const unsigned/g' demo.h
	#cp $(PROJ).blif $(PROJ)_.blif

demo.rpt: demo.asc
	icetime -d up5k -mtr $@ $<


demo.asc: demo.blif demo.pcf
	arachne-pnr -d 5k -p demo.pcf $< -o $@

demo.bin: demo.asc
	icepack $< $@

clean:
	rm -f demo.h demo.blif demo.asc demo.rpt demo.bin demo.h

.PHONY: synthesize