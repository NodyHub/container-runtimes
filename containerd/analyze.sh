#!/bin/bash

tcpdump -w traffic.pcap port 53 &
TCPDUMP_PID=$!

sleep 5

DOCKER_IMAGE=docker.io/library/alpine:latest
DOCKER_IMAGE=quay.io/jitesoft/alpine:latest

ctr image pull $DOCKER_IMAGE

kill $TCPDUMP_PID

exit 0

