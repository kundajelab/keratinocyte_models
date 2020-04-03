#!/bin/bash
db_ingest --tiledb_metadata keratinocyte.tasks.tsv \
	  --array_name db_keratinocyte \
	  --overwrite \
	  --chrom_sizes hg38.chrom.sizes \
	  --attribute_config multi_peak \
	  --coord_tile_size 10000 \
	  --task_tile_size 1 \
	  --write_chunk 30000000 \
	  --threads 20 \
	  --max_queue_size 50 \
	  --max_mem_g 200



