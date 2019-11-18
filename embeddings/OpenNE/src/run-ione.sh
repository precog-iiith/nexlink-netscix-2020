#!/bin/sh


# local embeddings
python -m openne --method line --input ../../../data/graphs/ione_fs.txt --graph-format edgelist --output ../../LINE/line_ione_fs_128D.txt --weighted --order 1 --epochs 50
python -m openne --method line --input ../../../data/graphs/ione_tw.txt --graph-format edgelist --output ../../LINE/line_ione_tw_128D.txt --weighted --order 1 --epochs 50


# cross embeddings
python -m openne --method node2vec --input ../../../data/node_pairs/ione_tw_fs_combined.txt --graph-format edgelist --output ../../node2vec/node2vec_ione_combined_128D.txt --weighted --p 1 --q 2
