#!/bin/bash

set -x

rm -rf calls_dataset
mkdir calls_dataset
mkdir calls_dataset/calls_complete_train
mkdir calls_dataset/calls_complete_test
time node extractFromJS.js calls --parallel 16 data/js/programs_50_training.txt data/js/programs_50

mv calls_complete_*.json calls_dataset/calls_complete_train/
cat calls_extra_*.txt > calls_dataset/calls_extra_train.txt
rm calls_extra_*.txt

time node extractFromJS.js calls --parallel 16 data/js/programs_50_eval.txt data/js/programs_50

mv calls_complete_*.json calls_dataset/calls_complete_test/
cat calls_extra_*.txt > calls_dataset/calls_extra_test.txt
rm calls_extra_*.txt

rm data-training-all-calls.json

rm -rf calls_dataset/calls_complete_train
rm -rf calls_dataset/calls_complete_test




