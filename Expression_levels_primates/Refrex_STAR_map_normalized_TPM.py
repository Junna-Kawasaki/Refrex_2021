#!/usr/bin/env python

"""
## calculate TPM from featureCount result
"""

import sys, re, os
import pandas as pd
import numpy as np
argvs = sys.argv

## input
count_f = argvs[1]
output_f = argvs[2]


## read featureCount result
df_count = pd.read_csv(count_f, sep="\t",  skiprows=2, names = ["Geneid", "Chr", "Start", "End", "Strand", "Length", "Reads"]) 
df_count = df_count.astype({"Length":int,"Reads":int})

df_count["FPKM"] = df_count["Reads"] / df_count["Length"] * 1E+3
df_count["TPM"] = df_count["FPKM"] /df_count["FPKM"].sum() * 1E+6

df_count.to_csv(output_f, sep="\t")
	