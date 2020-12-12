#!/bin/bash
bin=("reliability" "main" "fill_array" "insert_sort")
command=("0xffff880000000000" "" "" "")
length=${#bin[@]}
quickhpc=/home/zhuxingyu/quickhpc/quickhpc
for (( i=0; i<$length; i++ ))
do
    filename=${bin[i]}
    run_command=${command[i]}
    pid=0
    taskset 0x1 ./$filename $run_command & pid=$! &&
    $quickhpc -a $pid -n 100 -i 100000 -c conf/events_example.conf > ./samples/$filename".txt" &&
    echo $pid
    kill -9 $pid
done
# for i in "${array[@]}"
# do
#     logname=$i".txt"
#     PID=0
#     sudo taskset 0x1 $i  & PID=$! & 
#     kill -9 $PID
# done
# sudo taskset 0x1 ./reliability 0xffff880000000000 && sudo quickhpc -a ${i} -n 1000 -i 100000 -c conf/events_example.conf > reliability.txt
# sudo taskset 0x1 ./main && sudo quickhpc -a ${i} -n 1000 -i 100000 -c conf/events_example.conf > main.txt
# sudo taskset 0x1 ./fill_array && sudo quickhpc -a ${i} -n 1000 -i 100000 -c conf/events_example.conf > fill_array.txt
# sudo taskset 0x1 ./insert_sort && sudo quickhpc -a ${i} -n 1000 -i 100000 -c conf/events_example.conf > insert_sort.txt
