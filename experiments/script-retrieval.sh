#!/bin/sh

python node-retrieval.py --alpha-s 0.5 --alpha-c 0.5 --embedding LINE --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.5 --alpha-c 0.9 --embedding LINE --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.5 --embedding LINE --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.9 --embedding LINE --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.5 --alpha-c 0.5 --embedding deepWalk --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.5 --alpha-c 0.9 --embedding deepWalk --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.5 --embedding deepWalk --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.9 --embedding deepWalk --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.5 --alpha-c 0.5 --embedding node2vec --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.5 --alpha-c 0.9 --embedding node2vec --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.5 --embedding node2vec --top-k 50 --embedding-size 128
python node-retrieval.py --alpha-s 0.9 --alpha-c 0.9 --embedding node2vec --top-k 50 --embedding-size 128
