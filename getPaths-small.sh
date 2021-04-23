#!/bin/bash

set -x

sh datasetModule-calls-small.sh
sh datasetModule-binoperand-small.sh
sh datasetModule-binoperator-small.sh

filename='calls_dataset/calls_extra_train.txt'
line_no=$(cat ${filename} | wc -l)
echo ${line_no}
a=$(( 2*${line_no}/10 ))
echo "$a"
b=$(( ${line_no} - ${a} ))

filename='binOperand_dataset/binOps_extra_train.txt'
line_no=$(cat ${filename} | wc -l)
echo ${line_no}
c=$(( 2*${line_no}/10 ))
echo "$c"
d=$(( ${line_no} - ${c} ))

filename='binOperator_dataset/binOps_extra_train.txt'
line_no=$(cat ${filename} | wc -l)
echo ${line_no}
e=$(( 2*${line_no}/10 ))
echo "$e"
f=$(( ${line_no} - ${e} ))


head -n ${b} calls_dataset/calls_extra_train.txt        >> temp1.txt
head -n ${d} binOperand_dataset/binOps_extra_train.txt  >> temp2.txt
head -n ${f} binOperator_dataset/binOps_extra_train.txt >> temp3.txt
cat temp1.txt temp2.txt temp3.txt > my_dataset.train.raw.txt

rm temp*.txt

tail -n ${a} calls_dataset/calls_extra_train.txt        >> temp1.txt
tail -n ${c} binOperand_dataset/binOps_extra_train.txt  >> temp2.txt
tail -n ${e} binOperator_dataset/binOps_extra_train.txt >> temp3.txt
cat temp1.txt temp2.txt temp3.txt > my_dataset.val.raw.txt

rm temp*.txt

cat calls_dataset/calls_extra_test.txt binOperand_dataset/binOps_extra_test.txt binOperator_dataset/binOps_extra_test.txt > my_dataset.test.raw.txt

mv *.raw.txt ../code2vec

cd ../code2vec

sh preprocessjs.sh

