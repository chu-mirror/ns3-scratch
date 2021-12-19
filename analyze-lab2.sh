#!/bin/sh

exp () {
	send1=$(tcpdump -nn -tt -r lab2-0-1.pcap 2>/dev/null | grep 'IP' | grep -v 'noise' | wc -l)
	send2=$(tcpdump -nn -tt -r lab2-2-1.pcap 2>/dev/null | grep 'IP' | grep -v 'noise' | wc -l)
	rec=$(tcpdump -nn -tt -r lab2-1-1.pcap 2>/dev/null | grep 'Ack' | wc -l)
	rec=$(expr $rec - 2)

	echo "Node 0 -> 1: " $send1
	echo "Node 2 -> 1: " $send2
	echo "Node 1 received: " $rec
}

cd ..
./waf --run "lab2 --rtscts=0"
echo "When disabled CTS/RTS"
exp
./waf --run "lab2 --rtscts=1"
echo "When enabled CTS/RTS"
exp
