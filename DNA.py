# Rosalind ID: DNA
# Title: Counting DNA Nucleotides

# Open the data file
with open('rosalind_dna.txt') as dna_file:
	dna = dna_file.read()

# Count the number of each nucleotide
counts = []
for x in ['A', 'C', 'G', 'T']:
	counts.append(str(dna.count(x)))

# Print counts
print(' '.join(counts))
