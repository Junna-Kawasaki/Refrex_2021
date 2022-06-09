# Expression_levels_primates  

**  **  
## Descriptions  
To perform mapping analysis using primate RNA-seq data, please try the program: **Refrex_expression_levels_primates_batch.sh**.  

- This program provides an example to mapping analysis for quantifying expression levels of truncated and full-length Env genes in a primate RNA-seq data.  
- Output file is **output_examples/chimpanzee/SRR1758915/TPM_SRR1758915.txt**.  

** **  
## Scripts  
1. Refrex_expression_levels_primates_batch.sh  
2. Refrex_expression_levels_primates_genome_index.sh  
3. Refrex_expression_levels_primates_gtf.sh  
4. Refrex_expression_levels_primates_mapping.sh  
5. Refrex_expression_levels_primates_TPM.sh  
6. Refrex_STAR_map_normalized_TPM.py  

## Usage
```
bash  Refrex_ortholog_based_dating_batch.sh 
``` 

**  **  
## Inputs
### genome file information
This file lists the URL for downloading the genome and gene annotation files.  
- Genome_info.txt

### SRA information  
This file lists SRA Run accession, genome file, gene annotation file for the mapping analysis.  
- Run_info.txt  

### Bed files
These files list the genomic position of the truncated and full-length Env genes in primate genomes.  
- refrex_chimpanzee.bed  
- refrex_crab_eating_macaque.bed  
- refrex_rheusus_macaque.bed  

