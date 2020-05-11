outdir=$1
model_name=$2

for fold in `seq 0 4`
do
    kerasAC_score_bpnet \
	--labels $outdir/$model_name.$fold.labels \
	--predictions $outdir/$model_name.$fold.predictions \
	--losses profile counts \
	--loss_suffixes 0 1 \
	--outf $outdir/$model_name.$fold.scores \
	--title "Keratinocyte ATAC, fold $fold, counts loss x30, seed 1234"
done
