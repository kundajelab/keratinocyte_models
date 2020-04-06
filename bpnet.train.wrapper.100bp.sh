#!/bin/bash
fold=0
task=keratinocytes-0h
bp=100
gpu=3
./bpnet.train.sh $fold $task $bp $gpu

