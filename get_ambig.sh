for task in keratinocytes-0.5d keratinocytes-0h keratinocytes-5.5d keratinocytes-1d keratinocytes-4.5d keratinocytes-1.5d keratinocytes-6d keratinocytes-5d keratinocytes-2d keratinocytes-3d keratinocytes-2.5d keratinocytes-4d keratinocytes-3.5d
do
    #seqdataloader_get_outliers --bed_regions_to_upsample /oak/stanford/groups/akundaje/marinovg/ENCODE4/ATAC/2020-03-23-training/$task.merged.sorted.MACS2-PE_peaks.radius-500bp.bed \
#			       --label_bigwig /oak/stanford/groups/akundaje/marinovg/ENCODE4/ATAC/2020-03-23-training/$task.merged.sorted.5p.counts.bigWig \
#			       --max_quantile 99 \
#			       --outf $task.outliers.bed &
    cat $task.outliers.bed all_three_blacklists.bed | cut -f1,2,3 | bedtools sort -i - | uniq > $task.ambig.bed 
done

