#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}


## tblastn
tblastn \
	-db ${input_folder}refseq-genomic \
	-query ${input_folder}primate_refrex.txt  \
	-out ${output_folder}primate_refrex.tblastn.refseq.txt \
	-outfmt "7 qseqid sseqid length qlen slen mismatch gapopen qstart qend sstart send evalue pident qseq sseq" \
	-evalue 1e-10 