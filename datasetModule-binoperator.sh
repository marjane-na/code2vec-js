#!/bin/bash

set -x

rm -rf binOperator_dataset
mkdir binOperator_dataset
mkdir binOperator_dataset/binOps_complete_train
mkdir binOperator_dataset/binOps_complete_test
time node extractFromJScopy.js binOps --parallel 16 programs_training.txt data/

mv binOps_complete_*.json binOperator_dataset/binOps_complete_train/
cat binOps_extra_*.txt > binOperator_dataset/binOps_extra_train.txt
rm binOps_extra_*.txt

time node extractFromJScopy.js binOps --parallel 16 programs_eval.txt data/

mv binOps_complete_*.json binOperator_dataset/binOps_complete_test/
cat binOps_extra_*.txt > binOperator_dataset/binOps_extra_test.txt
rm binOps_extra_*.txt

rm data-training-all-binOps.json

rm -rf binOperator_dataset/binOps_complete_train
rm -rf binOperator_dataset/binOps_complete_test




