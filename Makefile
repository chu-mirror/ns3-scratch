ALL = lab1.cc lab2.cc lab3.cc

MWEB = mweb 1

.SUFFIXES: .mwc .mw
.mwc.mw:
	cat $< lab.mwc > $@
.mw.cc:
	${MWEB} $< "ns3 script" $@

all: ${ALL}
	cd .. && ./waf

clean:
	rm -f ${ALL}

${ALL}: lab.mwc
