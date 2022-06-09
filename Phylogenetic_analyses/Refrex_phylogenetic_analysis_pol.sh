#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}

## mafft alignment
# reference
mafft --auto \
	${input_folder}pol_20210511.fas \
	> ${output_folder}pol_20210511.mafft.fas

# add primate pols
mafft --keeplength --mapout \
	--addfragments ${input_folder}pol_primate_20210511.fasta \
	--auto ${output_folder}pol_20210511.mafft.fas \
	> ${output_folder}pol_tree_20210511.fas

## not trimed sites and make tree
rm ${output_folder}pol_tree_20210511.fas.*

iqtree \
	-s ${output_folder}pol_tree_20210511.fas \
	-m TESTNEW \
	-bb 1000 \
	-redo \
	-nt AUTO