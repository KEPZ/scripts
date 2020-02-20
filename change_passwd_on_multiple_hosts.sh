#!/usr/bin/env bash
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
