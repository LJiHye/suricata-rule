#!/bin/bash

LIST=url_list
RULE=test.rules
LOG=/var/log/suricata/fast.log
COUNT=10000

#set rules
if [ -e $RULE ]; then
    cat /dev/null > $RULE
fi

while read URL
do
    COUNT=`expr $COUNT + 1`
    SPLIT=`echo $URL | awk '{split($0, arr, "/"); print arr[3]}'`
    if [[ $URL =~ "https" ]]; then
	    echo "alert tls any any -> any 443 (msg:\"$SPLIT access\"; tls.sni; content:\"$SPLIT\"; sid:$COUNT; rev:1;)" >> $RULE
	    continue
    fi
    echo "alert tcp any any -> any 80 (msg:\"$SPLIT access\"; content:\"GET /\"; content:\"Host: \"; content:\"$SPLIT\"; sid:$COUNT; rev:1;)" >> $RULE
done < $LIST


# run suricata
suricata -s $RULE -i eth0 &>/dev/null &

# countdown
echo "Wait 3 seconds!"
for i in 3 2 1
do
    echo $i ...
    sleep 1
done

echo "---------------------------------"
echo "Running ..."

# request
while read URL
do
    #curl -i $URL
    echo $URL
    curl $URL &>/dev/null
done < $LIST

# kill suricata process
kill -15 `ps -a | grep -i "Suricata" | awk '{print $1}'`

# print fast.log
echo "---------------------------------"
echo "All done :) Let's check the log!"
echo "---------------------------------"
cat $LOG

# mv fast.log into pwd
mv $LOG .
