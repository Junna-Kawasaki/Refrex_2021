#!/usr/bin/env python

"""
## tblastn to bed for bedtools merge
"""

import sys, re, os
import pandas as pd
import numpy as np
argvs = sys.argv

## input
blast_f = argvs[1]
output_f = argvs[2]

## read and convert to bed
f = open(output_f, "w")

i = -1
for line in open(blast_f):
	if "#" not in line:
		i += 1
		info_l = line.strip().split("\t")
		name,chrom,alen,qlen,slen,mis,gap,qstart,qend,sstart,send,evalue,pident, qseq,sseq = info_l[:15]
		sstart, send = [int(c) for c in [sstart, send]]
		
		if sstart < send:
			strand = "+"
			start = sstart
			end = send
		else:
			strand = "-"
			start = send
			end = sstart
		
		bed_l = [chrom, start, end, name, i, strand]
		f.write("\t".join(map(str, bed_l)) + "\n")

f.close()