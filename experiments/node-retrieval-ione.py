
# coding: utf-8

import sys
sys.path.insert(0, '..')


from config.path_config import OutputPaths, EmbeddingPaths, NodePairPaths
from config.constants import Constants

import argparse
import numpy as np
import csv
import random
import os

random.seed(42)


parser = argparse.ArgumentParser()
parser.add_argument('--embedding', required=True, help='Embedding option for second step')
parser.add_argument('--top-k', type=int, required=True, help='Value for k to compute top-k rate')
parser.add_argument('--embedding-size', required=True, help='Length of the embedding vector')
parser.add_argument('--walk-len', type=int, help='Length of nodepair random walk')
args = parser.parse_args()


def read_nodepairs(path):
    nodepair_list = list()
    with open(path, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        for row in reader:
            nodepair_list.append(tuple((row[0], row[1], float(row[2]))))
    return nodepair_list


def read_single_graph_line_embeddings(path):
    node_embedding_dict = dict()
    with open(path, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        first_line =  True
        for row in reader:
            if first_line:
                first_line = False
                continue
            # skip last element of the row which is an empty string
            embedding = np.array(row[1:(len(row))], dtype='float64')
            node_label = row[0]
            node_embedding_dict[node_label] = embedding
    return node_embedding_dict


def read_combined_line_embeddings(path):
    node_u_embedding_dict = dict()
    node_v_embedding_dict = dict()
    with open(path, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        first_line =  True
        for row in reader:
            if first_line:
                first_line = False
                continue
            # skip last element of the row which is an empty string
            embedding = np.array(row[1:(len(row))], dtype='float64')
            node_label = row[0]
            if node_label[-1] == 'u':
                node_u_embedding_dict[node_label] = embedding
            else:
                node_v_embedding_dict[node_label] = embedding
    return node_u_embedding_dict, node_v_embedding_dict

within_node_u_LINE = read_single_graph_line_embeddings(EmbeddingPaths.ione_LINE.format(args.embedding_size, nw='tw'))
within_node_v_LINE = read_single_graph_line_embeddings(EmbeddingPaths.ione_LINE.format(args.embedding_size, nw='fs'))


across_node_u_LINE, across_node_v_LINE = read_combined_line_embeddings(EmbeddingPaths.ione_combined_node2vec.format(args.embedding_size))


index = list(across_node_u_LINE.keys())[0]
print(across_node_u_LINE[index].shape)


print(len(within_node_u_LINE), len(across_node_u_LINE), len(within_node_v_LINE), len(across_node_v_LINE))


seed_list = read_nodepairs(NodePairPaths.ione_nodepairs.format(type='seed'))
nonseed_list = read_nodepairs(NodePairPaths.ione_nodepairs.format(type='nonseed'))


seed_list = list(set(seed_list))
nonseed_list = list(set(nonseed_list))


print(len(seed_list), len(nonseed_list))


nodepair_list = seed_list + nonseed_list


def get_similar_nodes_parallel(seed_tuple):
    seed_u, seed_v = seed_tuple
    u_embed = np.concatenate((within_node_u_LINE[seed_u], across_node_u_LINE[seed_u]))
    similarity_list = list()
    for node_v in across_node_v_LINE.keys():
        v_embed = np.concatenate((within_node_v_LINE[node_v], across_node_v_LINE[node_v]))
        cos_sim = np.dot(u_embed, v_embed)/(np.linalg.norm(u_embed)*np.linalg.norm(v_embed))
        similarity_list.append(tuple((node_v, cos_sim)))
    similarity_list = sorted(similarity_list, key=lambda x: x[1], reverse=True)
    max_hit = hit_list[-1]
    top_k_matches = similarity_list[:max_hit]
    hit = [0 for i in hit_list]
    for idx, (node_v, sim) in enumerate(top_k_matches):
        if seed_v == node_v:
            for th_idx, top_hit in enumerate(hit_list):
                if idx <= top_hit:
                    hit[th_idx] = 1
            break
    return hit


from multiprocessing import Pool
import time

#hit_list = [1, 5, 10, 20, 50]
# hit_list = list(np.arange(args.top_k))
hit_list = list(range(1, args.top_k+1))
start_time = time.time()
pool = Pool()
results = pool.map(get_similar_nodes_parallel, [((seed_u, seed_v)) for seed_u, seed_v, cn in seed_list])
end_time = time.time()
pool.close()


from datetime import timedelta

print('Time elapsed: ', timedelta(seconds=(end_time - start_time)))
np_results = np.array(results)
np_results_sum = np.sum(np_results, axis=0)
out_file = OutputPaths.ione_accuracy_file.format(args.embedding_size)
out_dir = os.path.dirname(out_file)
if not os.path.exists(out_dir):
    os.makedirs(out_dir)
with open(out_file, 'w') as csv_file:
    for idx, hit_number in enumerate(hit_list):
        print('hit ratio@{} : {}'.format(hit_number, np_results_sum[idx]/len(seed_list)))
        csv_writer = csv.writer(csv_file, delimiter=',')
        csv_writer.writerow([hit_number, np_results_sum[idx]/len(seed_list)])