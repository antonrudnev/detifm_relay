#!/bin/sh

tz="America/New_York"

while read time_delta
do
    if [ -z "$time_delta" ]
    then
        now=$(date --utc)
        tz_dif=$(($(TZ=Europe/Moscow date -d "$now" +%:::z)-$(TZ=$tz date -d "$now" +%:::z)))
        now_hr=$(TZ=$tz date -d "$now" +%H)
        if [ "$now_hr" -ge 2 -a "$now_hr" -lt 12 ]
        then
            echo $(date -d "-$((tz_dif+1)) hours" +%Y-%m-%dT%H:%M:%S)
        elif [ "$now_hr" -ge 12 -a "$now_hr" -lt 16 ]
        then
            echo $(date -d "-$tz_dif hours" +%Y-%m-%dT%H:%M:%S)
        else
            echo $(date -d "-$((tz_dif-1)) hours" +%Y-%m-%dT%H:%M:%S)
        fi
    else
        echo $(date -d "$time_delta" +%Y-%m-%dT%H:%M:%S)
    fi
done
