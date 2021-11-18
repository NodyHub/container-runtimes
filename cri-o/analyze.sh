#!/bin/bash

tcpdump -w traffic.pcap port 53 2> /dev/null &
TCPDUMP_PID=$!

DOCKER_IMAGE=docker.io/library/alpine:latest
DOCKER_IMAGE=quay.io/jitesoft/alpine:latest

ctr image rm $DOCKER_IMAGE 2> /dev/null
ctr image pull $DOCKER_IMAGE

kill $TCPDUMP_PID

echo
echo
echo DNS Querys:
echo -----------
tcpdump -r traffic.pcap port 53 2> /dev/null | grep 'A?' | cut -d " " -f 9 | uniq
echo

exit 0

