# Open dna file
dna <- readChar("~/Rosalind_Python/rosalind_rna.txt", nchars = file.info("~/Rosalind_Python/rosalind_rna.txt")$size)
dna

# Remove \r\n at the end of dna sequence
dna_v2 <- gsub("\r\n", "", dna)
dna_v2

# Solution 1: Biostrings --------------------------------------------------

# Load library Biostrings
library(Biostrings)

# Convert into a DNAString object
dna_v3 <- DNAString(dna_v2)
dna_v3

# Transcribe DNA string to RNA
rna <- as.character(RNAString(dna_v3))
rna

write.table(rna, "Solution_RNA.txt", row.names = FALSE, col.names = FALSE, sep = "")

# Solution 2: Substitute T for U ------------------------------------------

rna <- gsub("T", "U", dna_v2)
rna
