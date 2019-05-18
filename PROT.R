# Rosalind ID: PROT
# Title: Translating RNA into Protein

# Load library Biostrings
library(Biostrings)

# Open rna file
rna <- readChar("~/Rosalind_Python/rosalind_prot.txt", nchars = file.info("~/Rosalind_Python/rosalind_prot.txt")$size)
rna

# Remove \r\n from the end of rna sequence
rna_v2 <- gsub("\r\n", "", rna)
rna_v2

# Convert into a RNAString object
rna_v3 <- RNAString(rna_v2)
rna_v3

# Translate RNA into amino acid
aa <- as.character(translate(rna_v3))
aa