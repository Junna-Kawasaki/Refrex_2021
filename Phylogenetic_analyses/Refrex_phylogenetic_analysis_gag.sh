#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}

## mafft alignment
# reference
mafft --auto \
	${input_folder}gag_20210512.fas \
	> ${output_folder}gag_20210512.mafft.fas

# add primate gags
mafft --keeplength --mapout \
	--addfragments ${input_folder}gag_primate_20210511.fasta \
	--auto ${output_folder}gag_20210512.mafft.fas \
	> ${output_folder}gag_tree_20210512.fas

## not trimed sites and make tree
rm ${output_folder}gag_tree_20210512.fas.*

iqtree \
	-s ${output_folder}gag_tree_20210512.fas \
	-m TESTNEW \
	-bb 1000 \
	-redo \
	-nt AUTO