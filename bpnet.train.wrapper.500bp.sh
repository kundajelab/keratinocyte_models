#!/bin/bash
fold=0
task=keratinocytes-0h
bp=500
gpu=1
./bpnet.train.sh $fold $task $bp $gpu

