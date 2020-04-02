import pandas as pd
from os import listdir
from os.path import isfile, join
import pdb

file_dict={} 
source_dir="/oak/stanford/groups/akundaje/marinovg/ENCODE4/ATAC/2020-03-23-training"
onlyfiles = [f for f in listdir(source_dir) if isfile(join(source_dir, f))]
for f in onlyfiles:
    fname=f.split('.merged')[0]
    fpath='/'.join([source_dir,f])
    print(fname)
    if fname not in file_dict:
        file_dict[fname]={} 
    if f.endswith('.merged.sorted.5p.counts.plus.bigWig'):
        file_dict[fname]['count_bigwig_plus_5p']=fpath
    elif f.endswith('.merged.sorted.5p.counts.minus.bigWig'):
        file_dict[fname]['count_bigwig_minus_5p']=fpath
    elif f.endswith('.merged.sorted.5p.counts.bigWig'):
        file_dict[fname]['count_bigwig_unstranded_5p']=fpath
    elif f.endswith('.merged.sorted.MACS2-PE_peaks.radius-500bp.bed'):
        file_dict[fname]['500bp_peak']=fpath
    elif f.endswith('.merged.sorted.MACS2-PE_peaks.radius-200bp.bed'):
        file_dict[fname]['200bp_peak']=fpath
    elif f.endswith('.merged.sorted.MACS2-PE_peaks.radius-100bp.bed'):
        file_dict[fname]['100bp_peak']=fpath
#create pandas dataframe
df=pd.DataFrame.from_dict(file_dict,orient='index')
df['dataset']=df.index
cols=['dataset','100bp_peak','200bp_peak','500bp_peak','count_bigwig_plus_5p','count_bigwig_minus_5p','count_bigwig_unstranded_5p']
df=df[cols]
df.to_csv("keratinocyte.tasks.tsv",header=True,sep='\t',index=False)

        



