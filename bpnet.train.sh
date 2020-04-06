for profile mo#!/bin/bash
fold=$1
task=$2
bp=$3
gpu=$4
CUDA_VISIBLE_DEVICES=$gpu kerasAC_train \
		    --batch_size 25 \
		    --ref_fasta /mnt/data/GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta \
		    --tdb_ambig_attribute ambig_peak \
		    --tdb_array /oak/stanford/groups/akundaje/projects/keratinocyte_models/db_keratinocyte-0h \
		    --tdb_partition_attribute_for_upsample $bp\bp_peak \
		    --tdb_partition_thresh_for_upsample 1 \
		    --tdb_input_source_attribute seq \
		    --tdb_input_aggregation None \
		    --tdb_input_transformation None \
		    --tdb_input_flank 673 \
		    --tdb_output_source_attribute count_bigwig_unstranded_5p count_bigwig_unstranded_5p \
		    --tdb_output_flank 500 500 \
		    --tdb_output_aggregation None sum \
		    --tdb_output_transformation None log \
		    --num_inputs 1 \
		    --num_outputs 2 \
		    --fold $fold \
		    --genome hg38 \
		    --num_train 100000 \
		    --num_valid 10000 \
		    --num_tasks 1 \
		    --upsample_threads 24 \
		    --threads 0 \
		    --max_queue_size 20 \
		    --patience 3 \
		    --patience_lr 2 \
		    --model_prefix $task.$bp\bp_peak.profile.peaks.only.bpnet.$fold \
		    --architecture_spec profile_bpnet_dnase \
		    --use_multiprocessing False \
		    --tasks $task \
		    --upsample_ratio_list_train 1.0 \
		    --upsample_ratio_list_eval 1.0 \
		    --model_params model_params.txt \
		    --trackables logcount_predictions_loss loss profile_predictions_loss val_logcount_predictions_loss val_loss val_profile_predictions_loss
