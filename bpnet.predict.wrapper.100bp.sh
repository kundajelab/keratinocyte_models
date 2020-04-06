#!/bin/bash
fold=0
task=keratinocytes-0h
bp=100
gpu=2
./bpnet.predict.sh $fold $task $bp $gpu

