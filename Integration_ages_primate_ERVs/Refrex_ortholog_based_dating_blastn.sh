#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}


## extract 10kbp upstream and downstream regions of CERV-like viral Env genes 
seqkit subseq \
	${input_folder}refseq-genomic \
	--bed ${output_folder}primate_refrex.tblastn.refseq.sorted.merged.bed \
	-u 10000 -d 10000 \
	> ${output_folder}primate_refrex.tblastn.sorted.merged.flank.fasta

# blastn database
makeblastdb \
	-in ${output_folder}primate_refrex.tblastn.sorted.merged.flank.fasta \
	-dbtype nucl \
	-parse_seqids \
	-out ${output_folder}primate_refrex.tblastn.sorted.merged.flank.DB

# blastn 
blastn \
	-query ${output_folder}primate_refrex.tblastn.sorted.merged.flank.fasta \
	-db ${output_folder}primate_refrex.tblastn.sorted.merged.flank.DB \
	-outfmt "7 qseqid sseqid length qlen slen mismatch gapopen qstart qend sstart send evalue pident" \
	-out ${output_folder}primate_refrex.tblastn.sorted.merged.flank.blastn.txt \
	-evalue 1e-10
