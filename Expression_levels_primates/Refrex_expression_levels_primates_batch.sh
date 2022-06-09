#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"
list_f=${input_folder}Run_info.txt

mkdir ${output_folder}


## make genome index
bash Refrex_expression_levels_primates_genome_index.sh

## make gtf file
bash Refrex_expression_levels_primates_gtf.sh

## mapping analysis
bash Refrex_expression_levels_primates_mapping.sh

## calculate TPM
bash Refrex_expression_levels_primates_TPM.sh