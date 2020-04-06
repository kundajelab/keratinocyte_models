kerasAC_loss_weights_bpnet  --tdb_array /oak/stanford/groups/akundaje/projects/keratinocyte_models/db_keratinocyte \
			    --chroms chr1 \
			    --upsample_attribute 100bp_peak \
			    --label_attribute count_bigwig_unstranded_5p \
			    --num_threads 1 \
			    --task keratinocytes-0h \
			    --upsample_thresh 1 \
			    --flank 500
kerasAC_loss_weights_bpnet  --tdb_array /oak/stanford/groups/akundaje/projects/keratinocyte_models/db_keratinocyte \
			    --chroms chr1 \
			    --upsample_attribute 200bp_peak \
			    --label_attribute count_bigwig_unstranded_5p \
			    --num_threads 1 \
			    --task keratinocytes-0h \
			    --upsample_thresh 1 \
			    --flank 500
kerasAC_loss_weights_bpnet  --tdb_array /oak/stanford/groups/akundaje/projects/keratinocyte_models/db_keratinocyte \
			    --chroms chr1 \
			    --upsample_attribute 500bp_peak \
			    --label_attribute count_bigwig_unstranded_5p \
			    --num_threads 1 \
			    --task keratinocytes-0h \
			    --upsample_thresh 1 \
			    --flank 500


