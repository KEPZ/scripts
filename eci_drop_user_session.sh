#!/usr/bin/env bash
#cron         :00 23 su - nms -c "/nms/scripts/eci_drop_user_session.sh"
#description  :This script will kill sessions which running for more than 12 hours
#author       :Ivan Luzinov
#date         :10/01/2019

echo "Before killing: " > /tmp/sessions_drop.log
SecUtils -l 1 -g All | grep "user group" | awk '{print $1,$(NF),$(NF-1)}' > /tmp/sessions_drop.log

SecUtils -l 1 -g All | grep "user group" | awk '{print $1,$(NF),$(NF-1)}' | /usr/xpg4/bin/awk -v now=`date +%d` -F"[:/] '{print $1,$2,$5}' | /usr/xpg4/bin/awk -v now=`date +%d` '{if ($3!=n) {print $1} else if ((24-$2)>12) {print $1}}' | xargs -n1 SecUtils -l 3 -u

echo "After killing: " > /tmp/sessions_drop.log
SecUtils -l 1 -g All | grep "user group" | awk '{print $1,$(NF),$(NF-1)}' > /tmp/sessions_drop.log
