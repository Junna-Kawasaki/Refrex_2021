#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}

## tblastn to bed
python \
	Refrex_tblastn_refseq_bed.py \
	${output_folder}primate_refrex.tblastn.refseq.txt \
	${output_folder}primate_refrex.tblastn.refseq.bed

## merge bed
cat ${output_folder}primate_refrex.tblastn.refseq.bed | \
	sort -k 1,1 -k 2,2n \
	> ${output_folder}primate_refrex.tblastn.refseq.sorted.bed
	
bedtools merge \
	-i ${output_folder}primate_refrex.tblastn.refseq.sorted.bed \
	> ${output_folder}primate_refrex.tblastn.refseq.sorted.merged.bed