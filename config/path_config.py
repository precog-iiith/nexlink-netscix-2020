class GraphPaths:
    fb_links = '../data/raw/facebook-links.txt'
    fb_subgraph = '../data/graphs/facebook_subgraph{0}_alpha_s_{1}_alpha_c_{2}.txt'
    ione_raw_tw = '../data/raw/IONE/twitter/following.number'
    ione_raw_fs = '../data/raw/IONE/foursquare/following.number'
    ione_raw_gt = '../data/raw/IONE/twitter_foursquare_groundtruth/groundtruth.number'
    ione = '../data/graphs/ione_{nw}.txt'
    
class NodePairPaths:
    fb_nodepairs = '../data/node_pairs/facebook_nodepairs_alpha_s_{0}_alpha_c_{1}_{type}.txt'
    ione_nodepairs = '../data/node_pairs/ione_tw_fs_{type}.txt'
    
class PlotPaths:
    CDF_plot = '../plots/cdf_{graph}_alpha_s_{alpha_s}_alpha_c_{alpha_c}.pdf'
    
class EmbeddingPaths:
    LINE = '../embeddings/LINE/line_facebook_{0}_alpha_s_{1}_alpha_c_{2}_{3}D.txt'
    deepWalk = '../embeddings/deepWalk/deepWalk_facebook_{0}_alpha_s_{1}_alpha_c_{2}_{3}D.txt'
    node2vec = '../embeddings/node2vec/node2vec_facebook_{0}_alpha_s_{1}_alpha_c_{2}_{3}D.txt'
    SDNE = '../embeddings/SDNE/sdne_facebook_{0}_alpha_s_{1}_alpha_c_{2}_{3}D.txt'
    
    ione_LINE = '../embeddings/LINE/line_ione_{nw}_{0}D.txt'
    ione_combined_node2vec = '../embeddings/node2vec/node2vec_ione_combined_{0}D.txt'
    
class OutputPaths:
    accuracy_file = '../results/{0}_facebook_alpha_s_{1}_alpha_c_{2}_{3}D.csv'
    ione_accuracy_file = '../results/ione_tw_fs_{0}D.csv'