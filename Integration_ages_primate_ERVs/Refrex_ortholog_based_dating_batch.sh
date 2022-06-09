#!/bin/bash

input_folder="input_examples/"
output_folder="output_examples/"

mkdir ${output_folder}

## search for CERV-like viral Env genes by tBLASTn
bash Refrex_ortholog_based_dating_tblastn.sh  

## convert tblastn result to bed file
bash Refrex_ortholog_based_dating_to_bed.sh

## compare the flanked sequences of CERV-like viral Env genes by BLASTn
bash Refrex_ortholog_based_dating_blastn.sh  

## calculation of alignment coverage
bash Refrex_ortholog_based_dating_coverage.sh