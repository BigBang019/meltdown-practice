#!/bin/bash
bin=("reliability" "main" "fill_array" "insert_sort" "physical_reader")
command=("0xffff880000000000" "" "" "" "0x91537c08 0xffff880000000000")
length=${#bin[@]}
quickhpc=/home/zhuxingyu/quickhpc/quickhpc
for (( i=0; i<$length; i++ ))
do
    filename=${bin[i]}
    run_command=${command[i]}
    pid=0
    taskset 0x1 ./$filename $run_command & pid=$! &&
    $quickhpc -a $pid -n 100 -i 100000 -c conf/events_example.conf > ./samples-2/$filename".txt" &&
    echo $pid
    kill -9 $pid
done