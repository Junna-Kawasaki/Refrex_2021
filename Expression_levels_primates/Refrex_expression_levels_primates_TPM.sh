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

## 
mkdir ${output_folder}${species}
mkdir ${output_folder}${species}/${sra}

# TPMの計算：${folder2}mapped/TPM/TPM_${species}.txt として出力
python \
	Refrex_STAR_map_normalized_TPM.py \
	${output_folder}${species}/${sra}/mapped/Aligned.out.txt \
	${output_folder}${species}/${sra}/TPM_${sra}.txt