# Rosalind ID: DNA
# Title: Counting DNA Nucleotides

# Open dna file
dna <- readChar("~/Rosalind_Python/rosalind_dna.txt", nchars = file.info("~/Rosalind_Python/rosalind_dna.txt")$size)

# Check structure of the file dna
str(dna)

# Load library stringr
library(stringr)

# Count A, C, G, T in dna
str_count(dna, c("A","C","G","T"))
