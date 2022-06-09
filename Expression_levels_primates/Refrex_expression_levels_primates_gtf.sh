#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"
list_f=${input_folder}Run_info.txt

mkdir ${output_folder}

# input
i=2
sra=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $1}')
species=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $2}')
gtf_f=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $3}')

bed_f=${input_folder}refrex_${species}.bed

## bed to gtf
python \
	Refrex_bed_to_gtf.py \
	${bed_f} \
	${output_folder}${species}/genome_index/refrex_${species}.gtf

## combine the gtf files
cat \
	${output_folder}${species}/genome_index/${gtf} \
	${output_folder}${species}/genome_index/refrex_${species}.gtf \
	> ${output_folder}${species}/genome_index/NCBI_refrex_${species}.gtf