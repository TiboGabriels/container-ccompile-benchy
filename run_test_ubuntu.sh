#!/bin/sh
FILE_EXTENSION="$(date +"%d-%m-%Y-%T")"
OUTPUT_FILE_NAME=test_results/ubuntu/test_output_$FILE_EXTENSION.txt
TIME_FILE_NAME=test_results/ubuntu/test_duration_$FILE_EXTENSION.txt
RESOURCES_FILE_NAME=test_results/ubuntu/test_internal_resources$FILE_EXTENSION.csv

monitorResources(){
    PID=$1
    echo $(ps | grep $PID)
    echo "Timestamp;Cpu Usage%;Memory Usage%;" > "$RESOURCES_FILE_NAME"
    TOTAL="$(free -m | grep Mem | tr -s ' ' | cut -d ' ' -f 2)"
    while ps -p $PID 2> /dev/null
    do 
        logResources
    done
}

logResources(){
    DATE=$(date +"%H:%M:%S")
    echo -n "$DATE;" >> "$RESOURCES_FILE_NAME"
    FREE_DATA=`free -m | grep Mem` 
    CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
    TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
    echo -n "$(echo "scale = 2; $CURRENT/$TOTAL*100" | bc);" >> "$RESOURCES_FILE_NAME"
    echo "$(top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}');" >> "$RESOURCES_FILE_NAME"

    sleep 1
}

cd /php-src
mkdir -p test_results/ubuntu/
{ time make -j $(nproc) 1> $OUTPUT_FILE_NAME ; } 2> $TIME_FILE_NAME &
monitorResources "$!"

wait
cat "$OUTPUT_FILE_NAME"
cat "$TIME_FILE_NAME"
cat "$RESOURCES_FILE_NAME"