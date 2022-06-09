#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}

## 
cat ${input_folder}primate_refrex_sequence_info.txt | \
	cut -f 2 > ${output_folder}primate_refrex_sequence_info.header.txt

## 
cat ${output_folder}primate_refrex.tblastn.sorted.merged.flank.blastn.txt | \
	grep -f ${output_folder}primate_refrex_sequence_info.header.txt \
	> ${output_folder}primate_refrex.tblastn.sorted.merged.flank.blastn.grep.txt

## calculate alignment coverage
python Refrex_ortholog_based_dating_coverage.py \
	${output_folder}primate_refrex.tblastn.sorted.merged.flank.blastn.grep.txt \
	${output_folder}primate_refrex.tblastn.sorted.merged.flank.blastn.grep.coverage.txt