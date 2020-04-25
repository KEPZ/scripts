#!/usr/bin/env bash
#title          :change_passwd_on_multiple_hosts.s
#description    :This script changes root passwords on multiple hosts.
#author         :Ivan Luzinov
#usage          :./scriptname.sh IAMSURE

if [ -z $1]
then
echo "WARNING! Usage: ./scriptname.sh IAMSURE"
else
#while read line; do ping -c 1 $line; done < /tmp/ip_list.txt
for server in $(cat list_hosts.txt)
do
echo $server
ssh root@$server 'passwd <<EOF
New_pass
New_pass
EOF';
echo "Execution code - $?"
echo '****************************************'
done
