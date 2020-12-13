#!/bin/bash
bin=("reliability" "whileloop" "fill_array" "insert_sort" "physical_reader")
command=("0xffff880000000000" "" "" "" "0xad5496c8 0xffff880000000000")
available=(PAPI_L1_DCM PAPI_L1_ICM PAPI_L2_DCM PAPI_L2_ICM PAPI_L1_TCM PAPI_L2_TCM PAPI_L3_TCM PAPI_CA_SNP PAPI_CA_SHR PAPI_CA_CLN PAPI_CA_ITV PAPI_L3_LDM PAPI_TLB_DM PAPI_TLB_IM PAPI_L1_LDM PAPI_L1_STM PAPI_L2_LDM PAPI_L2_STM PAPI_PRF_DM PAPI_MEM_WCY PAPI_STL_ICY PAPI_FUL_ICY PAPI_STL_CCY PAPI_FUL_CCY PAPI_BR_UCN PAPI_BR_CN PAPI_BR_TKN PAPI_BR_NTK PAPI_BR_MSP PAPI_BR_PRC PAPI_TOT_INS PAPI_LD_INS PAPI_SR_INS PAPI_BR_INS PAPI_RES_STL PAPI_TOT_CYC PAPI_LST_INS PAPI_L2_DCA PAPI_L3_DCA PAPI_L2_DCR PAPI_L3_DCR PAPI_L2_DCW PAPI_L3_DCW PAPI_L2_ICH PAPI_L2_ICA PAPI_L3_ICA PAPI_L2_ICR PAPI_L3_ICR PAPI_L2_TCA PAPI_L3_TCA PAPI_L2_TCR PAPI_L3_TCR PAPI_L2_TCW PAPI_L3_TCW PAPI_SP_OPS PAPI_DP_OPS PAPI_VEC_SP PAPI_VEC_DP PAPI_REF_CYC)
length=${#bin[@]}
quickhpc=/home/zhuxingyu/quickhpc/quickhpc
target_path=./samples_t/
count=1
for i in "${available[@]}"
    do
    echo COUNTS:$count
    count=$((count+1))
    output_path=$target_path$i
    [ -d $output_path ] || mkdir $output_path
    echo $i > conf/events_example.conf
    for (( j=0; j<$length; j++ ))
    do
        filename=${bin[j]}
        run_command=${command[j]}
        pid=0
        taskset 0x1 ./$filename $run_command & pid=$! &&
        $quickhpc -a $pid -n 100 -i 100000 -c conf/events_example.conf > $output_path/$filename".txt" &&
        echo $pid
        kill -9 $pid
    done
    
done
