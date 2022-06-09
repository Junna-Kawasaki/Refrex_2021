#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"
list_f=${input_folder}Genome_info.txt

mkdir ${output_folder}

# input
i=2
species=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $1}')
genome_f=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $2}')
gtf_f=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $3}')
genome=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $4}')
gtf=$(cat ${list_f} | awk -v I=${i} 'BEGIN{FS="\t"}NR==I{print $5}')

## genome_index
mkdir ${output_folder}${species}
mkdir ${output_folder}${species}/genome_index

## download genome and gene annotation
wget ${genome_f} --directory-prefix=${output_folder}${species}/genome_index
wget ${gtf_f} --directory-prefix=${output_folder}${species}/genome_index

gunzip ${output_folder}${species}/genome_index/${genome}.gz
gunzip ${output_folder}${species}/genome_index/${gtf}.gz

## genome index
STAR --runMode genomeGenerate \
	--genomeDir ${output_folder}${species}/genome_index \
	--genomeFastaFiles ${output_folder}${species}/genome_index/${genome} \
	--sjdbGTFfeatureExon ${foutput_folder}${species}/genome_index/${gtf} \
	--limitGenomeGenerateRAM 220000000000 

