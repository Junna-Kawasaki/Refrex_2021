# Integration_ages_primate_ERVs

**  **  
## Descriptions  
To perform estimation of integrated ages of promate ERVs, please try the program: **Refrex_ortholog_based_dating_batch.sh**.  

- Output file is **output_examples/primate_refrex.tblastn.sorted.merged.flank.blastn.grep.coverage.txt**.  

** **  
## Scripts  
1. Refrex_ortholog_based_dating_batch.sh 
2. Refrex_ortholog_based_dating_tblastn.sh  
3. Refrex_ortholog_based_dating_to_bed.sh  
4. Refrex_tblastn_refseq_bed.py  
5. Refrex_ortholog_based_dating_blastn.sh  
6. Refrex_ortholog_based_dating_coverage.sh  
7. Refrex_ortholog_based_dating_coverage.py  

## Usage
- Please download the NCBI RefSeq genomic database in **input_examples/** before running this program.  
```
bash  Refrex_ortholog_based_dating_batch.sh 
```

- The intermediate files produced by each program were listed in **intermediate_examples/** and can be used as input file of each program in **Refrex_ortholog_based_dating_batch.sh** by moving the file to **output_examples/**.  

**  **  
## Inputs
### query sequences for tBLASTn search
- input_examples/primate_refrex.txt  

### Sequence information of CERV-like viral Env gene
- input_examples/primate_refrex_sequence_info.txt

## Intermediate files
- primate_refrex.tblastn.refseq.txt  
Result file of **Refrex_ortholog_based_dating_tblastn.sh**.  
