#!/bin/sh

tz="America/New_York"

while read time_delta
do
    if [ -z "$time_delta" ]
    then
        now=$(date --utc)
        now_hr=$(TZ=$tz date -d "$now" +%H)
        tz_dif=$(($(TZ=Europe/Moscow date -d "$now" +%:::z)-$(TZ=$tz date -d "$now" +%:::z)))
        if [ "$now_hr" -ge 0 -a "$now_hr" -lt 9 ]
        then
            shft=$((tz_dif+1))
        elif [ "$now_hr" -ge 17 -a "$now_hr" -lt 21 ]
        then
            shft=$((tz_dif-1))
        else
            shft=$((tz_dif))
        fi
        echo $(date -d "-$shft hours" +%Y-%m-%dT%H:%M:%S)
    else
        echo $(date -d "$time_delta" +%Y-%m-%dT%H:%M:%S)
    fi
done
