#!/bin/bash

set -x

rm -rf binOperand_dataset
mkdir binOperand_dataset
mkdir binOperand_dataset/binOps_complete_train
mkdir binOperand_dataset/binOps_complete_test
time node extractFromJS.js binOps --parallel 16 data/js/programs_50_training.txt data/js/programs_50/

mv binOps_complete_*.json binOperand_dataset/binOps_complete_train/
cat binOps_extra_*.txt > binOperand_dataset/binOps_extra_train.txt
rm binOps_extra_*.txt

time node extractFromJS.js binOps --parallel 16 data/js/programs_50_eval.txt data/js/programs_50/

mv binOps_complete_*.json binOperand_dataset/binOps_complete_test/
cat binOps_extra_*.txt > binOperand_dataset/binOps_extra_test.txt
rm binOps_extra_*.txt

rm data-training-all-binOps.json

rm -rf binOperand_dataset/binOps_complete_train
rm -rf binOperand_dataset/binOps_complete_test




