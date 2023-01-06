#!/bin/sh
FILE_EXTENSION="$(date +"%d-%m-%Y-%T")"
OUTPUT_FILE_NAME=test_results/alpine/test_output_$FILE_EXTENSION.txt
TIME_FILE_NAME=test_results/alpine/test_duration_$FILE_EXTENSION.txt
RESOURCES_FILE_NAME=test_results/alpine/test_internal_resources$FILE_EXTENSION.csv
START_TIMESTAMP=$(date "+%s")

monitorResources(){
    PID=$1
    echo $(ps | grep $PID)
    echo "Timestamp; T+;Cpu Usage %;Memory Usage %;" > "$RESOURCES_FILE_NAME"
    TOTAL="$(free -m | grep Mem | tr -s ' ' | cut -d ' ' -f 2)"
    while ps -p $PID 2> /dev/null
    do 
        logResources
    done
}

logResources(){
    DATETIME=$(date +"%s")
    TIMESTAMP=$(($DATETIME - $START_TIMESTAMP))
    echo -n "$DATETIME;" >> "$RESOURCES_FILE_NAME"
    echo -n "$TIMESTAMP;" >> "$RESOURCES_FILE_NAME"
    CPU_IDL=$(mpstat 1 1 | tr ' ' '\n' | tail -n 1)
    echo -n "$(echo "scale = 4; (100 - $CPU_IDL) / 100" | bc);" >> "$RESOURCES_FILE_NAME"
    FREE_DATA=`free -m | grep Mem` 
    CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
    TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
    echo "$(echo "scale = 4; $CURRENT/$TOTAL" | bc);" >> "$RESOURCES_FILE_NAME"
    sleep 1
}

cd /php-src
mkdir -p test_results/alpine/
{ time make -j $(nproc) 1> $OUTPUT_FILE_NAME ; } 2> $TIME_FILE_NAME &
monitorResources "$!"

wait
cat "$OUTPUT_FILE_NAME"
cat "$TIME_FILE_NAME"
cat "$RESOURCES_FILE_NAME"