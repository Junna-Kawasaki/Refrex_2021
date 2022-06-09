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

## download sra
fasterq-dump ${sra} --force -O ${output_folder}${species}/${sra} -p

## quality control
fastp \
	-i  ${output_folder}${species}/${sra}/${sra}_1.fastq \
	-I ${output_folder}${species}/${sra}/${sra}_2.fastq \
	-o ${output_folder}${species}/${sra}/${sra}.sra_1_fastp.fastq \
	-O ${output_folder}${species}/${sra}/${sra}.sra_2_fastp.fastq \
	-w 4 -y -3 -x

## mapping analysis
mkdir ${output_folder}${species}/${sra}/mapped

rm -r ${output_folder}${species}/${sra}/temp_STAR_a

## mapping
STAR \
	--genomeDir ${output_folder}${species}/genome_index \
	--readFilesIn ${output_folder}${species}/${sra}/${sra}.sra_1_fastp.fastq \
	${output_folder}${species}/${sra}/${sra}.sra_2_fastp.fastq \
	--sjdbGTFfeatureExon ${output_folder}${species}/genome_index/NCBI_refrex_${species}.gtf  \
	--outSAMtype BAM Unsorted \
	--chimOutType WithinBAM Junctions \
	--outFileNamePrefix ${output_folder}${species}/${sra}/mapped/ \
	--outTmpDir ${output_folder}${species}/${sra}/temp_STAR_a 

## calculation of RPKM
rm ${output_folder}${species}/${sra}/mapped/Aligned.out.sorted.bam.tmp.*.bam

samtools sort ${output_folder}${species}/${sra}/mapped/Aligned.out.bam \
	-o ${output_folder}${species}/${sra}/mapped/Aligned.out.sorted.bam

## featureCounts
featureCounts -t exon -g gene_id \
	-a ${output_folder}${species}/genome_index/NCBI_refrex_${species}.gtf \
	-o ${output_folder}${species}/${sra}/mapped/Aligned.out.txt \
	${output_folder}${species}/${sra}/mapped/Aligned.out.sorted.bam \
	-p  -O -M --fraction
