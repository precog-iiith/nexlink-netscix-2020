#!/bin/sh


# local embeddings
python -m openne --method line --input ../../../data/graphs/facebook_subgraph1_alpha_s_0.5_alpha_c_0.5.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph1_alpha_s_0.5_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50 
python -m openne --method line --input ../../../data/graphs/facebook_subgraph2_alpha_s_0.5_alpha_c_0.5.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph2_alpha_s_0.5_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50

python -m openne --method line --input ../../../data/graphs/facebook_subgraph1_alpha_s_0.5_alpha_c_0.9.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph1_alpha_s_0.5_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50 
python -m openne --method line --input ../../../data/graphs/facebook_subgraph2_alpha_s_0.5_alpha_c_0.9.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph2_alpha_s_0.5_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50

python -m openne --method line --input ../../../data/graphs/facebook_subgraph1_alpha_s_0.9_alpha_c_0.5.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph1_alpha_s_0.9_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50 
python -m openne --method line --input ../../../data/graphs/facebook_subgraph2_alpha_s_0.9_alpha_c_0.5.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph2_alpha_s_0.9_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50

python -m openne --method line --input ../../../data/graphs/facebook_subgraph1_alpha_s_0.9_alpha_c_0.9.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph1_alpha_s_0.9_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50 
python -m openne --method line --input ../../../data/graphs/facebook_subgraph2_alpha_s_0.9_alpha_c_0.9.txt --graph-format edgelist --output ../../LINE/line_facebook_subgraph2_alpha_s_0.9_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50


# cross embeddings
python -m openne --method line --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.5_combined.txt --graph-format edgelist --output ../../LINE/line_facebook_combined_alpha_s_0.5_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50
python -m openne --method line --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../LINE/line_facebook_combined_alpha_s_0.5_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50
python -m openne --method line --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.5_combined.txt --graph-format edgelist --output ../../LINE/line_facebook_combined_alpha_s_0.9_alpha_c_0.5_128D.txt --weighted --order 1 --epochs 50
python -m openne --method line --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../LINE/line_facebook_combined_alpha_s_0.9_alpha_c_0.9_128D.txt --weighted --order 1 --epochs 50

python -m openne --method deepWalk --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.5_combined.txt --graph-format edgelist --output ../../deepWalk/deepWalk_facebook_combined_alpha_s_0.5_alpha_c_0.5_128D.txt --weighted
python -m openne --method deepWalk --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../deepWalk/deepWalk_facebook_combined_alpha_s_0.5_alpha_c_0.9_128D.txt --weighted
python -m openne --method deepWalk --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.5_combined.txt --graph-format edgelist --output .../../deepWalk/deepWalk_facebook_combined_alpha_s_0.9_alpha_c_0.5_128D.txt --weighted
python -m openne --method deepWalk --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../deepWalk/deepWalk_facebook_combined_alpha_s_0.9_alpha_c_0.9_128D.txt --weighted

python -m openne --method node2vec --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.5_combined.txt --graph-format edgelist --output ../../node2vec/node2vec_facebook_combined_alpha_s_0.5_alpha_c_0.5_128D.txt --weighted --p 1 --q 2
python -m openne --method node2vec --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.5_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../node2vec/node2vec_facebook_combined_alpha_s_0.5_alpha_c_0.9_128D.txt --weighted --p 1 --q 2
python -m openne --method node2vec --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.5_combined.txt --graph-format edgelist --output ../../node2vec/node2vec_facebook_combined_alpha_s_0.9_alpha_c_0.5_128D.txt --weighted --p 1 --q 2
python -m openne --method node2vec --input ../../../data/node_pairs/facebook_nodepairs_alpha_s_0.9_alpha_c_0.9_combined.txt --graph-format edgelist --output ../../node2vec/node2vec_facebook_combined_alpha_s_0.9_alpha_c_0.9_128D.txt --weighted --p 1 --q 2
