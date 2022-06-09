# Phylogenetic_analyses

**  **  
## Descriptions  
<br>  

### Gag and Pol tree  
To perform phylogenetic analyses using gag and pol genes of retroviruses, please try the program: **Refrex_phylogenetic_analysis_gag.sh** or **Refrex_phylogenetic_analysis_pol.sh**.  

- Output files are **output_examples/gag_tree_20210512.fas.treefile** or **output_examples/pol_tree_20210512.fas.treefile**.  

### Env tree  
The phylogenetic tree of gammaretrovirus env genes was constructed based on the neighbor-joining method using the JTT model.  
Tree robustness was evaluated using the bootstrap method (1,000 replicates).  
The programs used to create this tree were implemented in MEGA X.  
In the **input_Env_tee**, the sequence alignment files were provided.  

** **  
## Scripts  
1. Refrex_phylogenetic_analysis_gag.sh  
2. Refrex_phylogenetic_analysis_pol.sh  

## Usage
```
bash Refrex_phylogenetic_analysis_gag.sh  

bash Refrex_phylogenetic_analysis_pol.sh  
```

**  **  
## Inputs
### multiple sequence alignment using reference sequences
- gag_20210512.fas  
- pol_20210511.fas

### primate ERV Env sequences 
- gag_primate_20210511.fasta  
- pol_primate_20210511.fasta

### sequence accession number  
- sequence_acc_list.txt  
This file lists the accession number of reference sequences.  
