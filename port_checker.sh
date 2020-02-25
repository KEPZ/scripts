#!/usr/bin/env bash

#set -e

printUsage() {
echo -e 'Usage:\n./port_checker.sh <ip_list.txt> <portNumber>\nExample:\n./port_checker.sh ip_list.txt 443 >/tmp/port_check$(date +"%Y%H%M%S").log 2>/tmp/port_check$(date +"%Y%H%M%S").err'
echo -e '0 - connection successful\n1 - connection failire prior to the timeout (refused)\n124 - connection not established by the timeout'
}

if [ -z "$1" -o -z "$2" ]
then
printUsage
exit 1
fi

cat $1 | while read LINE; do
timeout 1 bash -c "cat < /dev/null > /dev/tcp/$LINE/$2"
x=$?
echo "$LINE:$2;$x"
done
