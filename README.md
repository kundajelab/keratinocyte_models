# keratinocyte_models
assembly-free keratinocyte models


## Getting seqdataloader and kerasAC 
To run the scripts below, you will need the seqdataloader and kerasAC code bases. The pip packages are outdated, so please install from source: 
```
#first install the latest tiledb version 
pip install --upgrade tiledb 

git clone https://github.com/kundajelab/seqdataloader
cd seqdataloader 
python setup.py build 
python setup.py develop 
```

```
git clone https://github.com/kundajelab/kerasAC.git 
cd kerasAC 
python setup.py build 
python setup.py develop 
```

## generating tiledb database and training models 
1) run `make_task_file.py` to  create tiledb representation of:

* dataset
* 100bp_peak
* 200bp_peak
* 500bp_peak
* count_bigwig_unstranded_5p
* count_bigwig_plus_5p
* count_bigwig_minus_5p

this produces keratinocyte.tasks.tsv

2) run `dbingest.sh` to store the dataset in tiledb format
This produces the tiledb database "db_keratinocyte"

3) run `bpnet.train.wrapper.sh` to train model on specific taskk/fold
