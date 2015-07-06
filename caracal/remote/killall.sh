#!/bin/bash

if [ -f "caracal.pid" ]; then
	
	for PID in $(cat caracal.pid)
	do 
		kill $PID
	done
	rm caracal.pid
fi