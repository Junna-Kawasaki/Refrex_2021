#!/usr/bin/env python
import sys, re
argvs = sys.argv
import os
import collections
import numpy as np
import pandas as pd
pd.set_option("display.max_colwidth", 200)
pd.set_option("display.max_columns", 200)
pd.set_option("display.max_rows", 300)

import glob

## input
blast_f = argvs[1]
output_f = argvs[2]

## calculate coverage
# read blast_f: coverage, evalue, pident

coverage_d = {}
evalue_d = {}
pident_d = {}

for line in open(blast_f):
	if "#" not in line:
		info_l = line.strip().split("\t")
		query, subject, alen, qlen, slen, mis, gap, qstart,qend,sstart,send,evalue,pident = info_l[:13]
		alen,qlen,slen,qstart,qend = [int(c) for c in [alen,qlen,slen,qstart, qend]]
		evalue,pident = [float(c) for c in [evalue, pident]]
		
		if query not in coverage_d.keys():
			coverage_d[query] = {}
			evalue_d[query] = {}
			pident_d[query] = {}
		
		if subject not in coverage_d[query].keys():
			coverage_d[query][subject] = [0] * qlen
			evalue_d[query][subject] = 100
			pident_d[query][subject] = 0
			
		## coverageの計算
		alen_l = list(range(qstart,qend))
		
		for i,a in enumerate(coverage_d[query][subject]):
			if i in alen_l:
				coverage_d[query][subject][i] = 1
			else:
				pass
				
		## evalue
		if evalue < evalue_d[query][subject]:
			evalue_d[query][subject] = evalue
			
		## pident
		if pident > pident_d[query][subject]:
			pident_d[query][subject] = pident

# read blast_f: summarize
blast_l = []
for query in coverage_d.keys():
	for subject in coverage_d[query].keys():
		coverage_l = coverage_d[query][subject]
		alignment_l = [i for i in coverage_l if i == 1]
		
		coverage = len(alignment_l)/len(coverage_l) * 100
		evalue = evalue_d[query][subject]
		pident = pident_d[query][subject]
		
		l = [query, subject, coverage, evalue, pident]
		blast_l.append(l)

# read blast_f: dataframe
df_blast = pd.DataFrame(blast_l, columns=["query", "subject", "coverage", "evalue", "pident"])
df_blast = df_blast.sort_values(["query", "coverage"], ascending=[True, False])
df_blast.to_csv(output_f, sep="\t")
