#!/bin/bash

servers="root@solo1"
function load() {
    ssh $1 'rm -f /opt/tester/tester'
    echo Load binaries to $(echo $1 | awk -F@ '{print $2}')
    scp -q dist/Debug/GNU-Linux-x86/tester  $1:/opt/tester 
    ssh $1 'killall tester'
    echo Restart tester on $(echo $1 | awk  -F@  '{print $2}')

}
if [ $# == 0 ];then
    for server in $servers;do 
	load $server
    done
else
    load $1
fi
echo Done
