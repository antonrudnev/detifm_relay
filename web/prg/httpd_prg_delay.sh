#!/bin/sh

while read time_delta
do
    if [ -z "$time_delta" ]
    then
        now=$(TZ=EST date +%H)
        if [ "$now" -ge 2 -a "$now" -lt 12 ]
        then
            echo $(date -d "-8 hours" +%Y-%m-%dT%H:%M:%S)
        elif [ "$now" -ge 12 -a "$now" -lt 16 ]
        then
            echo $(date -d "-7 hours" +%Y-%m-%dT%H:%M:%S)
        else
            echo $(date -d "-6 hours" +%Y-%m-%dT%H:%M:%S)
        fi
    else
        echo $(date -d "$time_delta" +%Y-%m-%dT%H:%M:%S)
    fi
done
