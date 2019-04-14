# Rosalind ID: RNA
# Title: Transcribing DNA into RNA

# Find file path
import os
os.path.abspath('rosalind_rna.txt')

# Open the data file
with open('rosalind_rna.txt') as dna_file:
	dna = dna_file.read()

# Substituting T for U 
rna = dna.replace("T", "U")
rna
