## NeXLink: Node Embedding Framework for Cross-Network Linkages Across Social Networks

This repository contains the code for the implementation of the paper titled NeXLink: Node Embedding Framework for Cross-Network Linkages Across Social Networks by Kaushal et al. published at [NetSci-X 2020](https://netscix2020tokyo.github.io/).

### Dataset
The raw graph dataset can be found in `/data/raw` directory.

### Dependencies
The project uses Python 3 dependencies explicitly, for processing and training. All the code is run on [JupyterLab ](https://github.com/jupyterlab/jupyterlab) computational environment and [Anaconda](https://anaconda.org/)  is used as a package manager as well as a virtual environment manager. 
All the dependencies are exported in the `environment.yml` file. Make a new environment using:
```
$ conda env create -f environment.yml
```

### Experiment Steps
+ Start by running a Jupyter Lab using `$ jupyter lab`.
+ `experiments` directory contains `construct-graph.ipynb` to read the raw dataset and create graph edgelists. Use `construct-nodepairs.ipynb` to create nodepairs from the graph edgelists. Similarly `IONE-dataset.ipynb` processes the real world dataset.
+ Change the directory to `embeddings/OpenNE/src/` and execute `run-augmented.sh` to extract node embeddings on the augmented dataset and `run-ione.sh` for the real world dataset. We generate the embeddings using [OpenNE](embeddings/OpenNE/src/) open source toolkit.
+ Once the embeddings are generated, go back to `experiments` and run `script-retrieval.sh` to get results on the augmented dataset and `script-retrieval-ione.sh` for the real world dataset.
+ The results should output in a directory `results` in the root folder as CSV files.

### Citation
If you found this code or our paper useful, please consider citing the following paper:
```
@inproceedings{kaushal2020nexlink,
    author = {
        Kaushal, Rishabh and
        Singh, Shubham and 
        Kumaraguru, Ponnurangam
    },
    title = {{NeXLink: Node Embedding Framework for Cross-Network Linkages Across Social Networks}},
    booktitle={International Conference and School on Network Science},
    location = {Tokyo, Japan},
    year={2020}
}
```
