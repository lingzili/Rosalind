# Rosalind ID: INI
# Title: Introduction to the Bioinformatics Armory

library(Biostrings)

# Open dna file
dna <- readChar("~/Rosalind_Python/rosalind_ini.txt", nchars = file.info("~/Rosalind_Python/rosalind_ini.txt")$size)
dna

# Remove \r\n at the end of dna sequence
dna_v2 <- gsub("\r\n", "", dna)
dna_v2

# Convert into a DNAString object
dna_v3 <- DNAString(dna_v2)
dna_v3

# Print occurance of "A", "C", "G" and "T"
for (nucleotide in c("A", "C", "G", "T")) {
  cat((countPattern(nucleotide, dna_v3)), " ")
}
 
