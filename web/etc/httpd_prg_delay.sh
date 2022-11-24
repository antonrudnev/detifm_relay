#!/bin/sh

tz="America/New_York"

while read time_delta
do
    if [ -z "$time_delta" ]
    then
        now=$(date --utc)
        tz_dif=$(($(TZ=Europe/Moscow date -d "$now" +%:::z)-$(TZ=$tz date -d "$now" +%:::z)))
        now_hr=$(TZ=$tz date -d "$now" +%H)
        if [ "$now_hr" -ge 0 -a "$now_hr" -lt 9 ]
        then
            echo $(date -d "-$((tz_dif+1)) hours" +%Y-%m-%dT%H:%M:%S)
        elif [ "$now_hr" -ge 17 -a "$now_hr" -lt 21 ]
        then
            echo $(date -d "-$((tz_dif-1)) hours" +%Y-%m-%dT%H:%M:%S)
        else
            echo $(date -d "-$((tz_dif)) hours" +%Y-%m-%dT%H:%M:%S)
        fi
    else
        echo $(date -d "$time_delta" +%Y-%m-%dT%H:%M:%S)
    fi
done
