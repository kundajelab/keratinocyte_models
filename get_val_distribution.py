import pandas as pd
import pyBigWig
import numpy as np 
peaks=pd.read_csv("/oak/stanford/groups/akundaje/marinovg/ENCODE4/ATAC/2020-03-23-training/keratinocytes-0h.merged.sorted.MACS2-PE_peaks.radius-500bp.bed",header=None,sep='\t')
bigwig=pyBigWig.open("/oak/stanford/groups/akundaje/marinovg/ENCODE4/ATAC/2020-03-23-training/keratinocytes-0h.merged.sorted.5p.counts.bigWig")
counts={}
total=peaks.shape[0] 
for index,row in peaks.iterrows():
    if index%1000==0:
        print(str(index)+'/'+str(total)) 
    chrom=row[0]
    start=row[1]
    end=row[2]
    cur_counts=np.sum(np.nan_to_num(bigwig.values(chrom,start,end,numpy=True)))
    counts[(chrom,start,end)]=cur_counts
counts=pd.DataFrame.from_dict(counts,orient='index')
counts.to_csv("coverage.counts.txt",header=False,index=True,sep='\t')

