ALL = lab1.cc lab2.cc lab3.cc

.SUFFIXES: .mwc .mw
.mwc.mw:
	cat $< lab.mwc > $@
.mw.cc:
	mweb $< "ns3 script" $@

all: ${ALL}
	cd .. && ./waf

clean:
	rm -f ${ALL}

${ALL}: lab.mwc
