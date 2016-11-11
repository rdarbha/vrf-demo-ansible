#! /bin/bash

{ sleep 2; echo "test"; sleep 1; echo "show $1 $2 $3 $4"; sleep 1; } |  telnet localhost bgpd

