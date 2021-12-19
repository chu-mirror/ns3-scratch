#!/bin/sh
exp () {
	send1=$(tcpdump -nn -tt -r lab3-0-0.pcap 2>/dev/null | grep 'IP' | grep -v 'noise' | wc -l)
	rec=$(tcpdump -nn -tt -r lab3-11-0.pcap 2>/dev/null | grep 'Ack' | wc -l)
	rec=$(expr $rec - 1)

	echo "Node 0 -> 11: " $send1
	echo "Node 11 received: " $rec
}

cd ..
./waf --run lab3
echo "The results"
exp
